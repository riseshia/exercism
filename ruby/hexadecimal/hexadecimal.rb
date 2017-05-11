class Hexadecimal
  CODES = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)

  def initialize(digits)
    @digits = digits
  end

  def to_decimal
    return 0 unless valid?

    @digits.chars.reduce(0) do |num, digit|
      (num << 4) + table[digit]
    end
  end

  private

  def table
    @_table ||= CODES.map.with_index { |ch, idx| [ch, idx] }.to_h
  end

  def valid?
    @digits.chars.all? { |ch| table[ch] }
  end
end
