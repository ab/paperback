require 'prawn'

# Main class for creating and rendering PDFs
module Paperback; class Document
  attr_reader :pdf, :debug

  def initialize(debug: false)
    log.debug('Document#initialize')
    @debug = debug
    @pdf = Prawn::Document.new
  end

  def log
    @log ||= Paperback.class_log(self.class)
  end

  def render(output_file:, draw_opts:)
    log.info('Rendering PDF')

    # Create all the PDF content
    draw_paperback(**draw_opts)

    # Render to output file
    log.info("Writing PDF to #{output_file.inspect}")
    pdf.render_file(output_file)
  end

  # High level method to draw the paperback content on the pdf document
  def draw_paperback(qr_code:, sixword_lines:, sixword_bytes:,
                     labels:, passphrase_sha: nil, passphrase_len: nil)
    unless qr_code.is_a?(RQRCode::QRCode)
      raise ArgumentError.new('qr_code must be RQRCode::QRCode')
    end

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

    draw_sixword(lines: sixword_lines, sixword_bytes: sixword_bytes)

    pdf.number_pages('<page> of <total>', align: :right,
                     at: [pdf.bounds.right - 100, -2])
  end

  # If in debug mode, draw axes on the page to assist with layout
  def debug_draw_axes
    return unless debug
    pdf.float { pdf.stroke_axis }
  end

  # Move cursor down by one line
  def add_newline
    pdf.move_down(pdf.font_size)
  end

  def draw_header(labels:, passphrase_sha:, passphrase_len:,
                  repo_url: 'https://github.com/ab/paperback')

    intro = [
      "This is a paper backup produced by `paperback`. ",
      "<u><link href='#{repo_url}'>#{repo_url}</link></u>",
    ].join
    pdf.text(intro, inline_format: true)
    add_newline

    label_pad = labels.keys.map(&:length).max + 1

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
        pdf.text('Be sure to cover the passphrase when scanning the QR code!')
      end
    end
  end

  # @param [Array<String>] lines An array of sixword sentences to print
  # @param [Integer] columns The number of text columns on the page
  # @param [Integer] hunks_per_row The number of 6-word sentences per line
  # @param [Integer] sixword_bytes Bytesize of the sixword encoded data
  def draw_sixword(lines:, sixword_bytes:, columns: 3, hunks_per_row: 1)
    debug_draw_axes

    numbered = lines.each_slice(hunks_per_row).each_with_index.map { |row, i|
      "#{i * hunks_per_row + 1}: #{row.map(&:strip).join('. ')}"
    }

    header = [
      "This sixword text encodes #{sixword_bytes} bytes in #{lines.length}",
      " six-word sentences.",
      " Decode with `sixword -d`"
    ].join

    pdf.font('Times-Roman') do
      pdf.text(header)
      add_newline
    end

    pdf.column_box([0, pdf.cursor], columns: columns, width: pdf.bounds.width) do
      pdf.font('Times-Roman') do
        pdf.font_size(11) do
          pdf.text(numbered.join("\n"))
        end
      end
    end
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
            pdf.fill_and_stroke_rectangle(xy, pixel_width, pixel_height)
          end
        end
      end
    end
  end
end; end
