module Complement
  module_function
  COMPLEMENT_TABLE = {
    "G" => "C",
    "C" => "G",
    "T" => "A",
    "A" => "U"
  }.freeze

  def of_dna(string)
    string.chars.map { |char| COMPLEMENT_TABLE.fetch(char) }.join("")
  rescue # invalid
    ""
  end
end

module BookKeeping
  VERSION = 4
end
