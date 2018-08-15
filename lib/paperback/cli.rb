module Paperback
  module CLI
    def self.create_backup(input:, output:, encrypt: true, qr_base64: true,
                           qr_level: :l, comment: nil, passphrase_file: nil)
      prep = Paperback::Preparer.new(filename: input, encrypt: encrypt,
                                     qr_base64: qr_base64, qr_level: qr_level,
                                     passphrase_file: passphrase_file,
                                     comment: comment)
      prep.render(output_filename: output)
    end
  end
end
