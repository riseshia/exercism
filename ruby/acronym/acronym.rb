module Acronym
  module_function

  def abbreviate(long_phrase)
    long_phrase
      .scan(/([A-Z]+[a-z]*|[a-z]+[A-Z]*)/) \
      .map { |words| words.first[0] }.join("").upcase
  end
end
module BookKeeping
  VERSION = 3
end
