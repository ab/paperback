# typed: strict
# frozen_string_literal: true

require 'prawn'

# Main class for creating and rendering PDFs
module Paperback; class Document
  extend T::Sig

  sig {returns(Prawn::Document)}
  attr_reader :pdf

  sig {returns(T::Boolean)}
  attr_reader :debug

  sig {params(debug: T::Boolean).void}
  def initialize(debug: false)
    log.debug('Document#initialize')
    @debug = T.let(debug, T::Boolean)
    @pdf = T.let(Prawn::Document.new, Prawn::Document)
    @log = T.let(nil, T.nilable(Logger))
  end

  sig {returns(Logger)}
  def log
    @log ||= Paperback.class_log(self.class)
  end

  sig do
    params(
      output_file: String,
      draw_opts: T::Hash[Symbol, T.untyped],
    )
      .void
  end
  def render(output_file:, draw_opts:)
    log.info('Rendering PDF')

    # Create all the PDF content
    draw_paperback(**T.unsafe(draw_opts))

    # Render to output file
    log.info("Writing PDF to #{output_file.inspect}")
    pdf.render_file(output_file)
  end

  # High level method to draw the paperback content on the pdf document
  #
  # @param qr_code
  # @param sixword_lines
  # @param sixword_bytes
  # @param labels
  # @param passphrase_sha
  # @param [Integer, nil] passphrase_len Length of the passphrase used to
  #   encrypt the original content. If this is not provided, then assume the
  #   original content was not encrypted and skip adding gpg -d instructions.
  # @param [Integer] sixword_font_size The font size to use for Sixword text
  # @param [String,nil] base64_content If provided, then append the original
  #   content (possibly encrypted) encoded using Base64.
  # @param [Integer, nil] base64_bytes The length of the original content
  #   before encoding to base64. This is used for the informational header.
  sig do
    params(
      qr_code: RQRCode::QRCode,
      sixword_lines: T::Array[String],
      sixword_bytes: Integer,
      labels: T::Hash[String, T.untyped],
      passphrase_sha: T.nilable(String),
      passphrase_len: T.nilable(Integer),
      sixword_font_size: T.nilable(Float),
      base64_content: T.nilable(String),
      base64_bytes: T.nilable(Integer),
    )
      .void
  end
  def draw_paperback(qr_code:, sixword_lines:, sixword_bytes:, labels:,
                     passphrase_sha: nil, passphrase_len: nil,
                     sixword_font_size: nil, base64_content: nil,
                     base64_bytes: nil)
    T.assert_type!(qr_code, RQRCode::QRCode)

    # Header & QR code page
    pdf.font('Times-Roman')

    debug_draw_axes

    draw_header(labels: labels, passphrase_sha: passphrase_sha,
                passphrase_len: passphrase_len)

    add_newline

    draw_qr_code(qr_modules: qr_code.modules)

    pdf.stroke_color '000000'
    pdf.fill_color '000000'

    # Sixword page

    pdf.start_new_page

    draw_sixword(lines: sixword_lines, sixword_bytes: sixword_bytes,
                 font_size: sixword_font_size,
                 is_encrypted: !!passphrase_len)

    if base64_content
      draw_base64(b64_content: base64_content, b64_bytes: T.must(base64_bytes),
                  is_encrypted: !!passphrase_len)
    end

    pdf.number_pages('<page> of <total>', align: :right,
                     at: [pdf.bounds.right - 100, -2])
  end

  # If in debug mode, draw axes on the page to assist with layout
  sig {void}
  def debug_draw_axes
    return unless debug
    pdf.float { pdf.stroke_axis }
  end

  # Move cursor down by one line
  sig {void}
  def add_newline
    pdf.move_down(pdf.font_size)
  end

  sig do
    params(
      labels: T::Hash[String, T.untyped],
      passphrase_sha: T.nilable(String),
      passphrase_len: T.nilable(Integer),
      repo_url: String,
    )
      .void
  end
  def draw_header(labels:, passphrase_sha:, passphrase_len:,
                  repo_url: 'https://github.com/ab/paperback')

    intro = [
      "This is a paper backup produced by `paperback`. ",
      "<u><link href='#{repo_url}'>#{repo_url}</link></u>",
    ].join
    pdf.text(intro, inline_format: true)
    add_newline

    label_pad = T.must(labels.keys.map(&:length).max) + 1

    unless passphrase_sha && passphrase_len
      labels['Encrypted'] = 'no'
    end

    pdf.font('Courier') do
      labels.each_pair do |k, v|
        pdf.text("#{(k + ':').ljust(label_pad)} #{v}")
      end

      if passphrase_sha
        pdf.text("SHA256(passphrase)[0...16]: #{passphrase_sha}")
      end
    end

    add_newline

    if passphrase_len
      pdf.font('Helvetica') do
        pdf.font_size(12.8) do
          pdf.text('Passphrase: ' + '_ ' * passphrase_len)
        end
      end

      pdf.move_down(8)
      pdf.indent(72) do
        pdf.text('Be sure to cover the passphrase when scanning the QR code!' +
                 ' Decrypt with `gpg -d`.')
      end
    end
  end

  # @param [Array<String>] lines An array of sixword sentences to print
  # @param [Integer] columns The number of text columns on the page
  # @param [Integer] hunks_per_row The number of 6-word sentences per line
  # @param [Integer] sixword_bytes Bytesize of the sixword encoded data
  sig do
    params(
      lines: T::Array[String],
      sixword_bytes: Integer,
      columns: Integer,
      hunks_per_row: Integer,
      font_size: T.nilable(Float),
      is_encrypted: T::Boolean,
    ).void
  end
  def draw_sixword(lines:, sixword_bytes:, columns: 3, hunks_per_row: 1,
                   font_size: nil, is_encrypted: true)
    font_size ||= 11

    debug_draw_axes

    numbered = lines.each_slice(hunks_per_row).each_with_index.map { |row, i|
      "#{i * hunks_per_row + 1}: #{row.map(&:strip).join('. ')}"
    }

    header = [
      "This sixword text encodes #{sixword_bytes} bytes in #{lines.length}",
      ' six-word sentences.',
      ' Decode with `sixword -d`',
      (is_encrypted ? ', then `gpg -d`.' : '.')
    ].join

    pdf.font('Times-Roman') do
      pdf.text(header)
      add_newline
    end

    pdf.column_box([0, pdf.cursor], columns: columns, width: pdf.bounds.width) do
      pdf.font('Times-Roman') do
        pdf.font_size(font_size) do
          pdf.text(numbered.join("\n"))
        end
      end
    end
  end

  sig do
    params(
      qr_modules: T::Array[T::Array[T::Boolean]],
    ).void
  end
  def draw_qr_code(qr_modules:)
    qr_height = pdf.cursor # entire rest of page
    qr_width = pdf.bounds.width # entire page width

    # number of modules plus 2 for quiet area
    qr_code_size = qr_modules.length + 2

    pixel_height = qr_height / qr_code_size
    pixel_width = qr_width / qr_code_size

    pdf.bounding_box([0, pdf.cursor], width: qr_width, height: qr_height) do
      if debug
        pdf.stroke_color('888888')
        pdf.stroke_bounds
      end

      qr_modules.each do |row|
        pdf.move_down(pixel_height)

        row.each_with_index do |pixel_val, col_i|
          pdf.stroke do
            pdf.stroke_color(pixel_val ? '000000' : 'ffffff')
            pdf.fill_color(pixel_val ? '000000' : 'ffffff')
            xy = [(col_i + 1) * pixel_width, pdf.cursor]
            pdf.fill_rectangle(xy, pixel_width, pixel_height)
          end
        end
      end
    end
  end

  # @param [String] b64_content
  sig do
    params(
      b64_content: String,
      b64_bytes: Integer,
      font_size: T.nilable(Float),
      is_encrypted: T::Boolean,
    ).void
  end
  def draw_base64(b64_content:, b64_bytes:, font_size: nil, is_encrypted: true)
    font_size ||= 11

    debug_draw_axes

    if is_encrypted
      header = [
        "This PGP text encodes #{b64_bytes} bytes in #{b64_content.length}",
        " characters. Decode with `gpg -d`."
      ].join
    else
      header = [
        "This base64 text encodes #{b64_bytes} bytes in #{b64_content.length}",
        " characters. Decode with `base64 --decode`."
      ].join
    end

    add_newline
    add_newline
    pdf.text(header)
    add_newline

    pdf.font('Courier') do
      pdf.text(b64_content)
    end

  end
end; end
