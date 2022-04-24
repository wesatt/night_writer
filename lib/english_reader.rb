require_relative "./character_translator"

class EnglishReader
  include CharacterTranslator

  attr_reader :txt_input

  def initialize(txt_input)
    @txt_input = txt_input
  end

  def self.read_txt(txt_input)
    EnglishReader.new(File.readlines(txt_input, chomp: true))
  end
end
