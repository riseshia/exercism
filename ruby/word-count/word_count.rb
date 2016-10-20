class Phrase
  attr_reader :word_count

  def initialize(string)
    words = stemming_word(string)
    @word_count = build_dictionary(words)
  end

  private

  def stemming_word(string)
    string.downcase.split(/[\s:;!&@$%^&,.]+/).map do |word|
      word.gsub(/^['"]|['"]$/, "")
    end
  end

  def build_dictionary(words)
    words.reduce({}) do |dic, word|
      dic.tap { |d| d[word] = d.fetch(word, 0) + 1 }
    end
  end
end

module BookKeeping
  VERSION = 1
end
