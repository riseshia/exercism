module Complement
  module_function

  RNA_TO_DNA = {
    "G" => "C",
    "C" => "G",
    "T" => "A",
    "A" => "U"
  }.freeze

  def of_dna(string)
    is_valid?(string) ? translate(string) : ""
  end
  
  def translate(string)
    string.chars.map { |char| RNA_TO_DNA.fetch(char) }.join("")
  end

  def is_valid?(string)
    permitted = string.chars.reject { |char| RNA_TO_DNA[char].nil? }
    string.size == permitted.size
  end
end

module BookKeeping
  VERSION = 4
end
