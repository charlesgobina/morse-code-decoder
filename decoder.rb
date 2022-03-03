MORSE_CODE_CONTAINER = {
  'A' => '.-', 'B' => '-...',
  'C' => '-.-.', 'D' => '-..', 'E' => '.',
  'F' => '..-.', 'G' => '--.', 'H' => '....',
  'I' => '..', 'J' => '.---', 'K' => '-.-',
  'L' => '.-..', 'M' => '--', 'N' => '-.',
  'O' => '---', 'P' => '.--.', 'Q' => '--.-',
  'R' => '.-.', 'S' => '...', 'T' => '-',
  'U' => '..-', 'V' => '...-', 'W' => '.--',
  'X' => '-..-', 'Y' => '-.--', 'Z' => '--..',
  '1' => '.----', '2' => '..---', '3' => '...--',
  '4' => '....-', '5' => '.....', '6' => '-....',
  '7' => '--...', '8' => '---..', '9' => '----.',
  '0' => '-----', ', ' => '--..--', '.' => '.-.-.-',
  '?' => '..--..', '/' => '-..-.', '-' => '-....-',
  '(' => '-.--.', ')' => '-.--.-'
}.freeze

def decode_char(mo_char)
  char_decoded = ''
  MORSE_CODE_CONTAINER.each do |key, value|
    char_decoded += key if mo_char == value
  end
  char_decoded
end

def decode_word(mo_word)
  word_decoded = ''
  mo_word = mo_word.split
  mo_word.each { |char| word_decoded += decode_char(char) }
  word_decoded
end

def decode_message(mo_message)
  message_decoded = ''
  mo_message = mo_message.split('   ')
  mo_message.each { |msg| message_decoded += " #{decode_word(msg)}" }
  message_decoded.strip
end

# decode_message(".-   -... --- -..-   ..-. ..- .-.. .-..   --- ..-.   .-. ..- -... .. . ...")
# => A BOX FULL OF RUBIES
