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

  def translate
    total_braille = []
    @txt_input[0].chars.each_slice(40) do |line|
      total_braille << translate_line(line)
    end
    total_braille.join("\n")
  end

  def translate_line(english_line)
    line1 = ""
    line2 = ""
    line3 = ""
    english_line.map do |char|
      braille = char_lookup(char)
      line1 += braille[0]
      line2 += braille[1]
      line3 += braille[2]
    end
    lines = [line1, line2, line3]
    lines.join("\n")
  end
end
