module Hamming
  module_function

  def compute(dna1, dna2)
    if dna1.size == dna2.size 
      dna1.chars.zip(dna2.chars).reject { |(nuc1, nuc2)| nuc1 == nuc2 }.count
    else
      raise ArgumentError, "DNA strands has difference length."
    end
  end
end
