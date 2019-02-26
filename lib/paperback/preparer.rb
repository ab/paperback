# frozen_string_literal: true

require 'base64'
require 'digest/sha2'
require 'securerandom'

require 'rqrcode'
require 'sixword'
require 'subprocess'

module Paperback
  # Class wrapping functions to prepare data for paperback storage, including
  # QR code and sixword encoding.
  class Preparer
    attr_reader :data
    attr_reader :labels
    attr_reader :qr_base64
    attr_reader :encrypt
    attr_reader :passphrase_file

    def initialize(filename:, encrypt: true, qr_base64: false, qr_level: nil,
                   comment: nil, passphrase_file: nil, include_base64: true)

      log.debug('Preparer#initialize')

      log.info("Reading #{filename.inspect}")
      plain_data = File.read(filename)

      log.debug("Read #{plain_data.bytesize} bytes")

      @encrypt = encrypt

      if encrypt
        @data = self.class.gpg_encrypt(filename: filename, password: passphrase)
      else
        @data = plain_data
      end
      @sha256 = Digest::SHA256.hexdigest(plain_data)

      @qr_base64 = qr_base64
      @qr_level = qr_level

      @passphrase_file = passphrase_file

      @include_base64 = !!include_base64

      @labels = {}
      @labels['Filename'] = filename
      @labels['Backed up'] = Time.now.to_s

      stat = File.stat(filename)
      @labels['Mtime'] = stat.mtime
      @labels['Bytes'] = plain_data.bytesize
      @labels['Comment'] = comment if comment

      @labels['SHA256'] = Digest::SHA256.hexdigest(plain_data)

      @document = Paperback::Document.new
    end

    def log
      @log ||= Paperback.class_log(self.class)
    end
    def self.log
      @log ||= Paperback.class_log(self)
    end

    def render(output_filename:, extra_draw_opts: {})
      log.debug('Preparer#render')

      opts = {
        labels: labels,
        qr_code: qr_code,
        sixword_lines: sixword_lines,
        sixword_bytes: data.bytesize,
      }

      if include_base64?
        opts[:base64_content] = base64_content
        opts[:base64_bytes] = data.bytesize
      end

      if encrypt
        opts[:passphrase_sha] = self.class.truncated_sha256(passphrase)
        opts[:passphrase_len] = passphrase.length
        if passphrase_file
          File.open(passphrase_file, File::CREAT|File::EXCL|File::WRONLY,
                   0400) do |f|
            f.write(passphrase)
          end
          log.info("Wrote passphrase to #{passphrase_file.inspect}")
        end
      end

      opts.merge!(extra_draw_opts)

      @document.render(output_file: output_filename, draw_opts: opts)

      log.info('Render complete')

      if encrypt
        puts "SHA256(passphrase)[0...16]: " + opts.fetch(:passphrase_sha)
        if !passphrase_file
          puts "Passphrase: #{passphrase}"
        end
      else
        log.info('Content was not encrypted')
      end
    end

    def passphrase
      raise "Can't have passphrase without encrypt" unless encrypt
      @passphrase ||= self.class.random_passphrase
    end

    PassChars = [*'a'..'z', *'A'..'Z', *'0'..'9'].freeze

    def self.random_passphrase(entropy_bits: 256, char_set: PassChars)
      chars_needed = (entropy_bits / Math.log2(char_set.length)).ceil
      (0...chars_needed).map {
        PassChars.fetch(SecureRandom.random_number(char_set.length))
      }.join
    end

    # Compute a truncated SHA256 digest
    def self.truncated_sha256(content)
      Digest::SHA256.hexdigest(content)[0...16]
    end

    def self.gpg_encrypt(filename:, password:)
      cmd = %w[
        gpg -c -o - --batch --cipher-algo aes256 --passphrase-fd 0 --
      ] + [filename]
      out = nil

      log.debug('+ ' + cmd.join(' '))
      Subprocess.check_call(cmd, stdin: Subprocess::PIPE,
                            stdout: Subprocess::PIPE) do |p|
        out, _err = p.communicate(password)
      end

      out
    end

    def self.gpg_ascii_enarmor(data, strip_comments: true)
      cmd = %w[gpg --batch --enarmor]
      out = nil

      log.debug('+ ' + cmd.join(' '))
      Subprocess.check_call(cmd, stdin: Subprocess::PIPE,
                            stdout: Subprocess::PIPE) do |p|
        out, _err = p.communicate(data)
      end

      if strip_comments
        out = out.each_line.select { |l| !l.start_with?('Comment: ') }.join
      end

      out
    end

    def self.gpg_ascii_dearmor(data)
      cmd = %w[gpg --batch --dearmor]
      out = nil

      log.debug('+ ' + cmd.join(' '))
      Subprocess.check_call(cmd, stdin: Subprocess::PIPE,
                            stdout: Subprocess::PIPE) do |p|
        out, _err = p.communicate(data)
      end

      out
    end

    # Whether to add the Base64 encoding to the generated document.
    #
    # @return [Boolean]
    def include_base64?
      !!@include_base64
    end

    private

    def qr_code
      @qr_code ||= qr_code!
    end

    def qr_code!
      log.info('Generating QR code')

      # Base64 encode data prior to QR encoding as requested
      if qr_base64
        input = base64_content
      else
        input = data
      end

      # If QR level not specified, pick highest level of redundancy possible
      # given the size of the input, up to Q (25% redundancy)
      unless @qr_level
        if input.bytesize <= 1663
          @qr_level = :q
        elsif input.bytesize <= 2331
          @qr_level = :m
        else
          @qr_level = :l
        end
      end

      log.debug("qr_level: #{@qr_level.inspect}")
      RQRCode::QRCode.new(input, level: @qr_level)
    end

    def sixword_lines
      log.info('Encoding with Sixword')
      @sixword_lines ||=
        Sixword.pad_encode_to_sentences(data).map(&:downcase)
    end

    def base64_content
      log.debug('Encoding with Base64')
      if encrypt
        # If data is already GPG encrypted, use GPG's base64 armor
        self.class.gpg_ascii_enarmor(data)
      else
        # Otherwise do plain Base64
        Base64.encode64(data)
      end
    end
  end
end
