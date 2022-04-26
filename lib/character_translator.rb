module CharacterTranslator
  # constant that can be called in methods of this module
  ASCII_TO_BRAILLE = {
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
  BRAILLE_TO_ASCII = ASCII_TO_BRAILLE.invert

  def char_lookup(char)
    if ASCII_TO_BRAILLE[char].nil?
      puts "An unknown character was encountered:"
      puts "Replaced '#{char}' with ' ' and continued processing."
      ["..", "..", ".."]
    else
      ASCII_TO_BRAILLE[char]
    end
  end

  def braille_lookup(braille)
    if BRAILLE_TO_ASCII[braille].nil?
      puts "An unknown Braille pattern was encountered:"
      puts "Replaced '#{braille}' with '[\"..\", \"..\", \"..\"]' and continued processing."
      " "
    else
      BRAILLE_TO_ASCII[braille]
    end
  end
end
