class SumOfMultiples
  attr_reader :bases

  def initialize(*args)
    @bases = args
  end

  def to(boundary)
    filtered_bases = bases.select { |base| boundary >= base }
    return 0 if filtered_bases.empty?

    (1...boundary).reduce(0) do |sum, num|
      multiple_of?(filtered_bases, num) ? sum + num : sum
    end
  end

  private

  def multiple_of?(bases, num)
    bases.any? { |base| num % base == 0 }
  end
end
