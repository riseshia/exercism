class Squares
  attr_accessor :target_number

  def initialize(target_number)
    self.target_number = target_number
  end

  def square_of_sum
    sum = (1 + target_number) * target_number / 2
    sum ** 2
  end

  def sum_of_squares
    (0..target_number).inject(0) { |sum, n| sum + n ** 2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION = 3
end
