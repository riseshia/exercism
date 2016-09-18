module Complement
  module_function

  RNA_TO_DNA = {
    "G" => "C",
    "C" => "G",
    "T" => "A",
    "A" => "U"
  }.freeze

  def of_dna(strand)
    dna?(strand) ? translate(strand) : ""
  end

  class << self
    private

    def translate(strand)
      strand.each_char.map { |char| RNA_TO_DNA[char] }.join
    end

    def dna?(strand)
      strand.each_char.all? { |char| RNA_TO_DNA.key? char }
    end
  end
end

module BookKeeping
  VERSION = 4
end
