module Hamming
  module_function

  def compute(dna1, dna2)
    raise ArgumentError, "DNA strands has difference length." \
      unless dna1.size == dna2.size
        
    dna1.chars.zip(dna2.chars).reject { |nuc1, nuc2| nuc1 == nuc2 }.size
  end
end

module BookKeeping
  VERSION = 3
end
