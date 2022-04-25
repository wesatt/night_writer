require_relative "./braille_reader"
require_relative "./character_translator"

# ruby ./lib/night_reader.rb braille.txt original_message.txt
breader = BrailleReader.read_braille(ARGV[0])
breader.file_write(ARGV[1])
