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
    attr_reader :base64_qr
    attr_reader :encrypt

    def initialize(filename:, encrypt: true, base64_qr: false, comment: 'This is a comment')
      log.debug('Preparer#initialize')

      log.info("Reading #{filename}")
      plain_data = File.read(filename)

      if encrypt
        @data = self.class.gpg_encrypt(filename: filename, password: passphrase)
      else
        @data = plain_data
      end
      @sha256 = Digest::SHA256.hexdigest(plain_data)

      @base64_qr = base64_qr
      @encrypt = encrypt

      @labels = {}
      @labels['Filename'] = filename
      @labels['Backed up'] = Time.now.to_s

      stat = File.stat(filename)
      @labels['Mtime'] = stat.mtime
      @labels['Bytes'] = plain_data.bytesize
      @labels['Comment'] = comment

      @labels['SHA256'] = Digest::SHA256.hexdigest(plain_data)

      @document = Paperback::Document.new
    end

    def log
      @log ||= Paperback.class_log(self.class)
    end
    def self.log
      @log ||= Paperback.class_log(self)
    end

    def render(output_filename:)

      opts = {
        labels: labels,
        qr_code: qr_code,
        sixword_lines: sixword_lines,
        sixword_bytes: data.bytesize,
        passphrase_sha: self.class.truncated_sha256(passphrase),
      }

      @document.render(output_file: output_filename, draw_opts: opts)

      log.info('Render complete')

      puts "Passphrase: #{passphrase}"
    end

    def passphrase
      @passphrase ||= self.class.random_passphrase
    end

    PassChars = [*'a'..'z', *'A'..'Z', *'0'..'9'].freeze

    def self.random_passphrase(entropy_bits: 256, char_set: PassChars)
      chars_needed = (entropy_bits / Math.log2(char_set.length)).ceil
      (0..chars_needed).map {
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

    private

    def qr_code
      @qr_code ||= qr_code!
    end

    def qr_code!
      log.info('Generating QR code')
      if base64_qr
        RQRCode::QRCode.new(Base64.encode64(data))
      else
        RQRCode::QRCode.new(data)
      end
    end

    def sixword_lines
      log.info('Encoding with Sixword')
      @sixword_lines ||=
        Sixword.pad_encode_to_sentences(data).map(&:downcase)
    end

  end
end
