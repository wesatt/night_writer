require_relative "./character_translator"

class EnglishReader
  include CharacterTranslator

  attr_reader :txt_input

  def initialize(txt_input)
    @txt_input = txt_input
  end

  def self.read_txt(english_path)
    EnglishReader.new(File.readlines(english_path, chomp: true))
  end

  def translate
    total_braille = []
    @txt_input.each do |input_element|
      input_element.chars.each_slice(40) do |line|
        total_braille << translate_line(line)
      end
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

  def file_write(path)
    File.write(path, translate)
    char_count = @txt_input.join.chars.count
    puts "Created '#{path}' containing #{char_count} characters"
  end
end
