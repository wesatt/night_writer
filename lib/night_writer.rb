require "pry"
# require_relative "english_reader"
# englishreader = EnglishReader.new(ARGV[0], ARGV[1])

module EnglishToBrailleDict
  def english_char_lookup(char)
    reference = {
      "a" => ["0.", "..", ".."]
    }
    reference[char]
  end
end

class EnglishReader
  include EnglishToBrailleDict

  attr_reader :txt_input

  def initialize(txt_input, output_path)
    @txt_input = txt_input
    @output_path = output_path
    @translated = translate_eng_to_bra(@txt_input)
  end

  def self.read_txt(txt, output_path)
    EnglishReader.new(File.readlines(txt, chomp: true)[0].chars, output_path)
  end

  def translate_eng_to_bra(txt_arr)
    txt_arr.map do |char|
      english_char_lookup(char)
    end
  end
end

class BrailleWriter
end

# file_output = File.open("./lib/#{ARGV[1]}", "w")

file_input = EnglishReader.read_txt(ARGV[0], ARGV[1])
char_num = file_input.txt_input.count
puts "Created '#{ARGV[1]}' containing #{char_num} characters"

# ruby ./lib/night_writer.rb message.txt braille.txt
