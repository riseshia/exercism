class Series
  attr_reader :digits

  def initialize(number)
    @digits = number.chars.map(&:to_i)
  end

  def slices(slice_size)
    raise ArgumentError, "It's too large" if digits.size < slice_size
    digits.each_cons(slice_size).to_a
  end
end
