# typed: true
# frozen_string_literal: true

module Paperback
  module CLI
    # Top level CLI interface for Paperback. This is the one stop shop for
    # calling paperback.
    #
    # @param [String] input The input filename
    # @param [String] output The output PDF filename
    # @param [Boolean] encrypt Whether to encrypt input with GPG.
    # @param [Boolean] qr_base64 Whether to base64 the data before encoding it
    #   as a QR code
    # @param [Symbol] qr_level Which level of QR code encoding, default `:l`
    # @param [String,nil] comment A comment to add to the printout
    # @param [String] passphrase_file A file to write the generated GPG
    #   passphrase to
    # @param [Hash] extra_draw_opts Other options passed to
    #   [Paperback::Preparer#render]
    # @param [Boolean] include_base64 Whether to include a Base64 copy of the
    #   input
    def self.create_backup(input:, output:, encrypt: true, qr_base64: true,
                           qr_level: :l, comment: nil, passphrase_file: nil,
                           extra_draw_opts: {}, include_base64: true)
      prep = Paperback::Preparer.new(filename: input, encrypt: encrypt,
                                     qr_base64: qr_base64, qr_level: qr_level,
                                     passphrase_file: passphrase_file,
                                     comment: comment,
                                     include_base64: include_base64)
      prep.render(output_filename: output, extra_draw_opts: extra_draw_opts)
    end
  end
end
