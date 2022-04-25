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
    expect(breader.translate).to eq("aa")
    # FIX: this test below may need to be updated
    expect(breader.translate_line([["0.", "n..", ".."], ["0.", "n..", ".."]])).to eq("aa")
  end
end
