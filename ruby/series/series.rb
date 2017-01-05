class Series
  def initialize(number)
    @digits = number.chars.map(&:to_i)
  end

  def slices(slice_size)
    raise ArgumentError, "Passed slice size is too large" \
      if digits.size < slice_size
    digits.each_cons(slice_size).to_a
  end
    
  private

  attr_reader :digits
end
