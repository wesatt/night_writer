require_relative "./spec_helper"

RSpec.describe CharacterTranslator do
  it "can translate a character into braille equivalent" do
    ereader = EnglishReader.read_txt("./spec/fixtures/input.txt")

    expect(ereader.char_lookup("a")).to eq(["0.", "..", ".."])
  end

  it "can translate braille into an ascii character" do
    breader = BrailleReader.read_braille("./spec/fixtures/braille_input.txt")
    expect(breader.braille_lookup(["0.", "..", ".."])).to eq("a")
  end
end
