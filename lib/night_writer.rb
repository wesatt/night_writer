require "pry"

module EnglishToBrailleDict
  def char_lookup(char)
    reference = {
      "a" => ["0.", "..", ".."],
      "b" => ["0.", "0.", ".."],
      "c" => ["00", "..", ".."],
      "d" => ["00", ".0", ".."],
      "e" => ["0.", ".0", ".."],
      "f" => ["00", "0.", ".."],
      "g" => ["00", "00", ".."],
      "h" => ["0.", "00", ".."],
      "i" => [".0", "0.", ".."],
      "j" => [".0", "00", ".."],
      "k" => ["0.", "..", "0."],
      "l" => ["0.", "0.", "0."],
      "m" => ["00", "..", "0."],
      "n" => ["00", ".0", "0."],
      "o" => ["0.", ".0", "0."],
      "p" => ["00", "0.", "0."],
      "q" => ["00", "00", "0."],
      "r" => ["0.", "00", "0."],
      "s" => [".0", "0.", "0."],
      "t" => [".0", "00", "0."],
      "u" => ["0.", "..", "00"],
      "v" => ["0.", "0.", "00"],
      "w" => [".0", "00", ".0"],
      "x" => ["00", "..", "00"],
      "y" => ["00", ".0", "00"],
      "z" => ["0.", ".0", "00"],
      " " => ["..", "..", ".."]
    }
    reference[char]
  end
end

class EnglishReader
  include EnglishToBrailleDict

  def initialize(txt_input)
    @txt_input = txt_input
  end

  def self.read_txt(txt_input)
    EnglishReader.new(File.readlines(txt_input, chomp: true)[0].chars)
  end

  def translate
    total_braille = []
    # FIXME: change to 40
    @txt_input.each_slice(6) do |line|
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

  def file_write(path)
    binding.pry
    File.write(path, translate)
    puts "Created '#{path}' containing #{@txt_input.count} characters"
  end
end

ereader = EnglishReader.read_txt(ARGV[0])
ereader.file_write(ARGV[1])

# ruby ./lib/night_writer.rb message.txt braille.txt
