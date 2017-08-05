module Atbash
  module_function

  ALPHABET = [*'a'..'z']
  DIGIT = [*'0'..'9']
  DIC = (ALPHABET + DIGIT).zip(ALPHABET.reverse + DIGIT).to_h

  def encode(raw)
    raw.downcase.chars.
      each_with_object([]) { |ch, result| result << DIC[ch] if DIC[ch] }.
      each_slice(5).map(&:join).join(' ')
  end
end
