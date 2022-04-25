require_relative "./spec_helper"

RSpec.describe EnglishReader do
  let(:ereader) { EnglishReader.read_txt("./spec/fixtures/input.txt") }

  it "exists" do
    expect(ereader).to be_a EnglishReader
  end

  it "can read text files" do
    expect(ereader.txt_input).to eq(["a"])
  end

  it "can translate Braille line by line" do
    expect(ereader.translate).to eq("0.\n..\n..")
    expect(ereader.translate_line(["a"])).to eq("0.\n..\n..")
  end

  describe "file creation" do
    include FakeFS::SpecHelpers
    it "can create and write to a file with text translated to Braille" do
      FakeFS do
        ereader = EnglishReader.new(["a"])
        ereader.file_write("braille.txt")
        expect(File).to exist("braille.txt")
        expect(File.read("braille.txt")).to eq("0.\n..\n..")
      end
    end
  end

  it "will print any charcater over 40 (80 in braille) on the next line" do
    string = "a" * 40 + "b" * 40
    ereader = EnglishReader.new([string])
    expect = (
      "0." * 40 + "\n" +
      ".." * 40 + "\n" +
      ".." * 40 + "\n" +
      "0." * 40 + "\n" +
      "0." * 40 + "\n" +
      ".." * 40
    )
    expect(ereader.translate).to eq(expect)
  end
end
