# typed: strict
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
    extend T::Sig

    sig {returns(String)}
    attr_reader :data

    sig {returns(T::Hash[String, T.untyped])}
    attr_reader :labels

    sig {returns(T::Boolean)}
    attr_reader :qr_base64

    sig {returns(T::Boolean)}
    attr_reader :encrypt

    sig {returns(T.nilable(String))}
    attr_reader :passphrase_file

    sig do
      params(
        filename: String,
        encrypt: T::Boolean,
        qr_base64: T::Boolean,
        qr_level: T.nilable(Symbol),
        comment: T.nilable(String),
        passphrase_file: T.nilable(String),
        include_base64: T::Boolean,
      ).void
    end
    def initialize(filename:, encrypt: true, qr_base64: false, qr_level: nil,
                   comment: nil, passphrase_file: nil, include_base64: true)

      log.debug('Preparer#initialize')

      # lazy initializers, all explicitly set to nil
      @log = T.let(nil, T.nilable(Logger))
      @qr_code = T.let(nil, T.nilable(RQRCode::QRCode))
      @sixword_lines = T.let(nil, T.nilable(T::Array[String]))
      @passphrase = T.let(nil, T.nilable(String))

      log.info("Reading #{filename.inspect}")
      plain_data = File.read(filename)

      log.debug("Read #{plain_data.bytesize} bytes")

      @encrypt = T.let(encrypt, T::Boolean)

      if encrypt
        @data = self.class.gpg_encrypt(filename: filename, password: passphrase)
      else
        @data = T.let(plain_data, String)
      end
      @sha256 = T.let(Digest::SHA256.hexdigest(plain_data), String)

      @qr_base64 = T.let(qr_base64, T::Boolean)
      @qr_level = T.let(qr_level, T.nilable(Symbol))

      @passphrase_file = T.let(passphrase_file, T.nilable(String))

      @include_base64 = T.let(!!include_base64, T::Boolean)

      @labels = T.let({}, T::Hash[String, T.untyped])
      @labels['Filename'] = filename
      @labels['Backed up'] = Time.now.to_s

      stat = File.stat(filename)
      @labels['Mtime'] = stat.mtime
      @labels['Bytes'] = plain_data.bytesize
      @labels['Comment'] = comment if comment

      @labels['SHA256'] = Digest::SHA256.hexdigest(plain_data)

      @document = T.let(Paperback::Document.new, Paperback::Document)
    end

    @log = T.let(nil, T.nilable(Logger))

    sig {returns(Logger)}
    def log
      @log ||= Paperback.class_log(self.class)
    end
    sig {returns(Logger)}
    def self.log
      @log ||= Paperback.class_log(self)
    end

    sig {params(output_filename: String, extra_draw_opts: T::Hash[T.untyped, T.untyped]).void}
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
          File.open(passphrase_file, File::CREAT | File::EXCL | File::WRONLY,
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
        puts 'SHA256(passphrase)[0...16]: ' + opts.fetch(:passphrase_sha)
        if !passphrase_file
          puts "Passphrase: #{passphrase}"
        end
      else
        log.info('Content was not encrypted')
      end
    end

    sig {returns(String)}
    def passphrase
      raise "Can't have passphrase without encrypt" unless encrypt
      @passphrase ||= self.class.random_passphrase
    end

    PassChars = T.let(
      [*'a'..'z', *'A'..'Z', *'0'..'9'].freeze, T::Array[String]
    )

    sig do
      params(entropy_bits: Integer, char_set: T::Array[String])
        .returns(String)
    end
    def self.random_passphrase(entropy_bits: 256, char_set: PassChars)
      chars_needed = (entropy_bits / Math.log2(char_set.length)).ceil
      (0...chars_needed).map {
        PassChars.fetch(SecureRandom.random_number(char_set.length))
      }.join
    end

    # Compute a truncated SHA256 digest
    sig {params(content: String).returns(String)}
    def self.truncated_sha256(content)
      Digest::SHA256.hexdigest(content)[0...16]
    end

    sig {params(filename: String, password: String).returns(String)}
    def self.gpg_encrypt(filename:, password:)
      cmd = %w[
        gpg -c -o - --batch --cipher-algo aes256 --passphrase-fd 0 --
      ] + [filename]
      out = T.let(nil, T.nilable(String))

      log.debug('+ ' + cmd.join(' '))
      Subprocess.check_call(cmd, stdin: Subprocess::PIPE,
                                 stdout: Subprocess::PIPE) do |p|
        out, _err = p.communicate(password)
      end

      T.must(out)
    end

    sig {params(data: String, strip_comments: T::Boolean).returns(String)}
    def self.gpg_ascii_enarmor(data, strip_comments: true)
      cmd = %w[gpg --batch --enarmor]
      out = T.let(nil, T.nilable(String))

      log.debug('+ ' + cmd.join(' '))
      Subprocess.check_call(cmd, stdin: Subprocess::PIPE,
                                 stdout: Subprocess::PIPE) do |p|
        out, _err = p.communicate(data)
      end

      out = T.must(out)

      if strip_comments
        out = out.each_line.select { |l| !l.start_with?('Comment: ') }.join
      end

      out
    end

    sig {params(data: String).returns(String)}
    def self.gpg_ascii_dearmor(data)
      cmd = %w[gpg --batch --dearmor]
      out = T.let(nil, T.nilable(String))

      log.debug('+ ' + cmd.join(' '))
      Subprocess.check_call(cmd, stdin: Subprocess::PIPE,
                                 stdout: Subprocess::PIPE) do |p|
        out, _err = p.communicate(data)
      end

      T.must(out)
    end

    # Whether to add the Base64 encoding to the generated document.
    #
    # @return [Boolean]
    sig {returns(T::Boolean)}
    def include_base64?
      !!@include_base64
    end

    private

    sig {returns(RQRCode::QRCode)}
    def qr_code
      @qr_code ||= qr_code!
    end

    sig {returns(RQRCode::QRCode)}
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

    sig {returns(T::Array[String])}
    def sixword_lines
      log.info('Encoding with Sixword')
      @sixword_lines ||=
        Sixword.pad_encode_to_sentences(data).map(&:downcase)
    end

    sig {returns(String)}
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
