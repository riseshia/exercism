class Say
  UNIT_TABLE = {
    1_000_000_000 => "billion",
    1_000_000 => "million",
    1_000 => "thousand",
    1 => ""
  }
  TENS_TABLE = {
    80 => "eighty",
    50 => "fifty",
    40 => "forty",
    30 => "thirty",
    20 => "twenty",
    14 => "fourteen",
    10 => "ten",
    9 => "nine",
    8 => "eight",
    7 => "seven",
    6 => "six",
    5 => "five",
    4 => "four",
    3 => "three",
    2 => "two",
    1 => "one"
  }
  def initialize(question)
    @question = question
  end

  def in_english
    validate!
    return "zero" if @question.zero?

    remain = @question
    says = []

    UNIT_TABLE.each do |unit, text|
      next if remain < unit

      q, r = remain.divmod(unit)

      says.concat(hundreds_in_english(q))
      says << text unless text.empty?
      remain = r
    end

    says.join(" ")
  end

  private

  def hundreds_in_english(number)
    [].tap do |says|
      if number >= 100
        q, r = number.divmod(100)
        says << "#{TENS_TABLE[q]} hundred"
        number = r
      end

      says << tens_in_english(number) if number > 0
    end
  end

  def tens_in_english(number)
    [].tap do |says|
      remain = number
      TENS_TABLE.each do |key, value|
        next if remain < key

        says << value
        remain -= key
      end
    end.join("-")
  end

  def validate!
    raise ArgumentError.new("negative value cannot be handled") if @question.negative?
    raise ArgumentError.new("too big to be handled") if @question > 999_999_999_999
  end
end

module BookKeeping
  VERSION = 1
end
