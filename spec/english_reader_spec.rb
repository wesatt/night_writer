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
end
