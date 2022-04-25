require_relative "./character_translator"

class BrailleReader
  include CharacterTranslator

  attr_reader :braille_input

  def initialize(braille_input)
    @braille_input = braille_input
  end

  def self.read_braille(braille_input)
    BrailleReader.new(File.readlines(braille_input, chomp: true))
  end
end
