require_relative "./english_reader"
require_relative "./character_translator"

# ruby ./lib/night_writer.rb message.txt braille.txt
ereader = EnglishReader.read_txt(ARGV[0])
ereader.file_write(ARGV[1])
