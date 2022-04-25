require_relative "./spec_helper"

RSpec.describe BrailleReader do
  let(:breader) { BrailleReader.read_braille("./spec/fixtures/braille_input.txt") }

  it "exists" do
    expect(breader).to be_a BrailleReader
  end

  it "can read braile files" do
    expect(ereader.braille_input).to eq(["0.", "..", ".."])
  end
end
