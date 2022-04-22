# require_relative "english_reader"
# englishreader = EnglishReader.new(ARGV[0], ARGV[1])

file_input = File.readlines(ARGV[0], chomp: true)
file_output = File.open(ARGV[1], "w")
char_num = file_input[0].chars.count
puts "Created '#{ARGV[1]}' containing #{char_num} characters"
