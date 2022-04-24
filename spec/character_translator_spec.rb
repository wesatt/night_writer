require_relative "./spec_helper"

RSpec.describe CharacterTranslator do
  it "can translate a character into braille equivalent" do
    expect(char_lookup("a")).to eq(["0.", "..", ".."])
  end
end
