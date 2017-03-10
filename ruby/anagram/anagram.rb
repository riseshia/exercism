require 'set'

# Anagram
class Anagram
  attr_accessor :word

  def initialize(word)
    self.word = word
  end

  def match(candiatated_words)
    target = transform(word)
    downcased_word = word.downcase

    candiatated_words.select do |cw|
      downcased_word != cw.downcase && target == transform(cw)
    end
  end

  private

  def transform(w)
    w.downcase.chars.sort.join('')
  end
end

module BookKeeping
  VERSION = 2
end
