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

  def translate
    total_ascii = ""
    @braille_input.each_slice(3) do |braille_line|
      full_line = []
      line1 = braille_line[0].chars.each_slice(2).map(&:join)
      line2 = braille_line[1].chars.each_slice(2).map(&:join)
      line3 = braille_line[2].chars.each_slice(2).map(&:join)
      line1.each_with_index do |two_chars, index|
        full_line << [two_chars, line2[index], line3[index]]
      end
      total_ascii += translate_line(full_line)
    end
    total_ascii
  end

  def translate_line(braille_line)
    line = braille_line.map do |braille|
      braille_lookup(braille)
    end
    line.join + "\n"
  end

  def file_write(path)
    File.write(path, translate)
    char_count = translate.delete("\n").chars.count
    puts "Created '#{path}' containing #{char_count} characters"
  end
end
