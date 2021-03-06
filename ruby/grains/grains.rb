module Grains
  module_function

  TOTAL_SQUARES = 64

  def square(number)
    2 ** (number - 1)
  end

  def total
    2 ** TOTAL_SQUARES - 1
  end
end

