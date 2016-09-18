class Fixnum
  TO_ROMAN = {
    1000 => "M",
    900  => "CM",
    500  => "D",
    400  => "CD",
    100  => "C",
    90   => "XC",
    50   => "L",
    40   => "XL",
    10   => "X",
    9    => "IX",
    5    => "V",
    4    => "IV",
    1    => "I"
  }

  def to_roman(number = self)
    remain_number = number
    TO_ROMAN.map do |roman_num, roman_char|
      times, remain_number = remain_number.divmod(roman_num)
      roman_char * times
    end.join
  end
end

module BookKeeping
  VERSION = 2
end
