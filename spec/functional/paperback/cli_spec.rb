# typed: false
# frozen_string_literal: true

require 'digest/sha2'
require 'fileutils'
require 'tmpdir'

require 'subprocess'

RSpec.describe Paperback::CLI do
  Executable = File.dirname(__FILE__) + '/../../bin/paperback'

  # pdftotext from poppler is a test dependency
  it 'finds system pdftotext installed (test dependency)' do
    expect(Subprocess.check_output(%w[which pdftotext])
          ).to match(/pdftotext/)
  end

  describe 'end-to-end test:' do
    before(:each) do
      @tmpdir = Dir.mktmpdir('paperback-rspec.')
      @orig_cwd = Dir.pwd
      Dir.chdir(@tmpdir)
    end

    after(:each) do
      Dir.chdir(@orig_cwd) if @orig_cwd
      FileUtils.rm_r(@tmpdir) if @tmpdir
      @tmpdir = nil
    end

    it 'backs up unencrypted content correctly' do
      secret = "The quick brown fox jumps over the lazy dog.\n"
      sha = 'b47cc0f104b62d4c7c30bcd68fd8e67613e287dc4ad8c310ef10cbadea9c4380'

      File.write('fox.txt', secret)

      expect(Digest::SHA256.hexdigest(File.read('fox.txt'))).to eq(sha)

      timestamp = Time.now.strftime('%F %T %z')

      expected = <<-EOM
This is a paper backup produced by `paperback`. https://github.com/ab/paperback
Filename:
Backed up:
Mtime:
Bytes:
Comment:
SHA256:
Encrypted:

fox.txt
#{timestamp}
#{timestamp}
45
Some comment
b47cc0f104b62d4c7c30bcd68fd8e67613e287dc4ad8c310ef10cbadea9c4380
no

1 of 2

\fThis sixword text encodes 45 bytes in 6 six-word sentences. Decode with `sixword -d`.
1: beak us ache sour bern lola
2: core arc hulk slid drew due
3: chub ends bog russ bess mast
4: dime arm skew quit kim san
5: coat mod hit need knew grim
6: cave ella raft fir a act3

This base64 text encodes 45 bytes in 61 characters. Decode with `base64 --decode`.
VGhlIHF1aWNrIGJyb3duIGZveCBqdW1wcyBvdmVyIHRoZSBsYXp5IGRvZy4K

2 of 2

\f
      EOM

      # strip trailing newline
      expected = expected[0...-1]

      # create the backup file!
      Paperback::CLI.create_backup(
        input: 'fox.txt', output: 'fox.pdf', encrypt: false,
        comment: 'Some comment'
      )

      # make sure we got a PDF
      expect(File.size('fox.pdf')).to be > 2000
      expect(File.read('fox.pdf', 20)).to start_with("%PDF-1.3\n")

      # convert to text to see what's in it
      Subprocess.check_call(%w[pdftotext fox.pdf fox.pdftotext.txt])

      expect(File.size('fox.pdftotext.txt')).to be > 100

      # This test is likely to break given even minor changes to paperback, so it
      # may not be particularly useful. However, it's nice to at least have some
      # kind of end-to-end test.
      expect(File.read('fox.pdftotext.txt')).to eq(expected)
    end

    it 'backs up encrypted content correctly' do
      secret = 'Ey9V03Iuq/gKLH0aVf2aPTAULWydpWt6G/L+O7LJXHeK'
      sha = '8675e6be1ae84a781b2a81c65b3300ee0611ccb3ad1e0b8e8dad5a94b6d4eef2'

      File.write('2.txt', secret)
      expect(Digest::SHA256.hexdigest(File.read('2.txt'))).to eq(sha)

      # create the backup file!
      Paperback::CLI.create_backup(
        input: '2.txt', output: '2.pdf', encrypt: true,
        passphrase_file: '2.passphrase.txt'
      )

      # make sure we got a PDF
      expect(File.size('2.pdf')).to be > 2000
      expect(File.read('2.pdf', 20)).to start_with("%PDF-1.3\n")

      # make sure we got a passphrase
      pass = File.read('2.passphrase.txt')
      expect(pass.length).to eq 43
      pass_sha = Digest::SHA256.hexdigest(pass)

      # convert pdf to text
      Subprocess.check_call(%w[pdftotext 2.pdf 2.pdftotext.txt])

      expect(File.size('2.pdftotext.txt')).to be > 100

      content = File.read('2.pdftotext.txt')

      expect(content).to include('2.txt')
      expect(content).to include(sha)
      expect(content).to include(pass_sha[0...16])

      # locate sixword content
      expect(content).to include('This sixword text')
      pages = content.split("\f")
      pg2 = pages.fetch(1)
      lines = pg2.split("\n")
      expect(lines.fetch(0)).to start_with('This sixword text')

      # pull sixword lines until blank line
      sixword_lines = []
      lines[1..-1].each do |line|
        break if line.strip.empty?
        expect(line).to match(/\A\d+: [a-z ]+[0-9]?\z/)
        sixword_lines << line.split(':').fetch(1)
      end

      # decode sixword content
      decoded = Sixword.decode(sixword_lines.join("\n"), padding_ok: true)

      # decrypt data
      File.write('2.sixword.gpg', decoded)
      p = Subprocess::Process.new(
        %w[gpg --batch --passphrase-fd 0 --decrypt 2.sixword.gpg],
        stdin: Subprocess::PIPE, stdout: Subprocess::PIPE
      )
      decrypted, _ = p.communicate(pass)
      expect(p.wait.exitstatus).to eq 0
      expect(p.wait.success?).to eq true

      expect(decrypted).to eq(secret)
    end

  end
end
