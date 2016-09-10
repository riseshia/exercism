module Hamming
  module_function

  def compute(dna1, dna2)
    raise ArgumentError unless dna1.size == dna2.size
    dna1.chars.zip(dna2.chars).inject(0) do |diff, (nuc1, nuc2)|
      diff + (nuc1 == nuc2 ? 0 : 1)
    end
  end
end
