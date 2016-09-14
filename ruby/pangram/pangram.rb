module Pangram
  module_function

  ALPHABETS = ("a".."z").to_a
  def is_pangram?(string)
    (ALPHABETS - string.downcase.chars.uniq).empty?
  end
end

module BookKeeping
  VERSION = 2
end
