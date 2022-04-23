require_relative "./spec_helper"

RSpec.describe EnglishReader do
  it "exists" do
    ereader = EnglishReader.read_txt("./spec/fixtures/input.txt")

    expect(ereader).to be_a EnglishReader
  end
end
