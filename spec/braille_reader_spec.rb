require_relative "./spec_helper"

RSpec.describe BrailleReader do
  let(:breader) { BrailleReader.read_braille("./spec/fixtures/braille_input.txt") }

  it "exists" do
    expect(breader).to be_a BrailleReader
  end

  it "can read braile files" do
    expect(breader.braille_input).to eq(["0.", "..", ".."])
  end

  it "can translate Braille into english characters line by line" do
    expect(breader.translate).to eq("a\n")
    expect(breader.translate_line([["0.", "..", ".."]])).to eq("a\n")
  end

  describe "file creation" do
    include FakeFS::SpecHelpers
    it "can create and write to a file with text translated to Braille" do
      FakeFS do
        breader = BrailleReader.new(["0.", "..", ".."])
        breader.file_write("original_message.txt")
        expect(File).to exist("original_message.txt")
        expect(File.read("original_message.txt")).to eq("a\n")
      end
    end
  end

  it "will detect unknown Braille patterns" do
    expect { breader.translate_line([["00", "00", "00"]]) }.to raise_error(RuntimeError, "An unknown Braille pattern was encountered:'[\"00\", \"00\", \"00\"]'")
  end
end
