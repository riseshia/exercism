class Binary
  attr_reader :binary_string

  def initialize(string)
    @binary_string = permit(string)
  end

  def to_decimal
    binary_string.split("").reduce(0) do |dec, digit|
      dec <<= 1
      dec += 1 if digit == "1"
      dec
    end
  end

  def permit(string)
    if string.delete("01").size.zero?
      string
    else
      raise ArgumentError, "given string is not binary string"
    end
  end
end

module BookKeeping
  VERSION = 2
end
