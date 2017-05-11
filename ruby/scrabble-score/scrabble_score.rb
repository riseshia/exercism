class Scrabble
  def initialize(str)
    @str = str.to_s.strip.upcase
  end

  def score
    @str.chars.reduce(0) { |score, ch| table[ch] + score }
  end

  def self.score(str)
    new(str).score
  end

  private

  def table
    @_table ||= {}.tap do |table|
      %w(A E I O U L N R S T).each { |ch| table[ch] = 1 }
      %w(D G).each { |ch| table[ch] = 2 }
      %w(B C M P).each { |ch| table[ch] = 3 }
      %w(F H V W Y).each { |ch| table[ch] = 4 }
      %w(K).each { |ch| table[ch] = 5 }
      %w(J X).each { |ch| table[ch] = 8 }
      %w(Q Z).each { |ch| table[ch] = 10 }
    end
  end
end
