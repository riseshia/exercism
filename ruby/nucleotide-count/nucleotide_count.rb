class Nucleotide
  attr_reader :histogram

  NUCLEOTIDES = %w(A T C G).freeze

  def initialize(dna)
    validate!(dna)
    @dna = dna
    @histogram = build_histogram
  end

  def count(nucleotide)
    @dna.count(nucleotide)
  end

  def build_histogram
    NUCLEOTIDES.product([0]).to_h.tap do |result|
      @dna.each_char do |nuc|
        result[nuc] += 1
      end
    end.freeze
  end

  def self.from_dna(dna)
    new(dna)
  end

  private

  def validate!(dna)
    dna.each_char do |ch|
      raise ArgumentError.new("#{ch} is not nucleotide.") \
        unless NUCLEOTIDES.include?(ch)
    end
  end
end
