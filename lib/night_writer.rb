# require_relative "english_reader"
# englishreader = EnglishReader.new(ARGV[0], ARGV[1])

file = File.readlines(ARGV[0], chomp: true)
file_output = ARGV[1]
char_num = file[0].chars.count
puts "Created '#{file_output}' containing #{char_num} characters"
