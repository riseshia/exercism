class Trinary
  attr_reader :number

  def initialize(number)
    self.number = number
  end

  def to_decimal
    number.to_i(3)
  end

  private

  attr_writer :number
end

module BookKeeping
  VERSION = 1
end
