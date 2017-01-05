class PhoneNumber
  attr_reader :area_code

  DIGIT_PATTERN = /\d/
  DELIMITER_PATTERN = /[()\s.-]/

  def initialize(phone_number)
    validate(phone_number)
  end

  def number
    area_code + middle_code + tail_code
  end

  def to_s
    "(#{area_code}) #{middle_code}-#{tail_code}"
  end

  private

  attr_reader :middle_code, :tail_code

  def validate(phone_number)
    sm = StateMachine.new(phone_number.chars)

    @tail_code = sm.consume(DIGIT_PATTERN, 4)
    sm.ignore(DELIMITER_PATTERN)
    @middle_code = sm.consume(DIGIT_PATTERN, 3)
    sm.ignore(DELIMITER_PATTERN)
    @area_code = sm.consume(DIGIT_PATTERN, 3)
    sm.ignore(DELIMITER_PATTERN)
    @international_code = sm.consume(/1/, 1, optional: true)
    sm.consume_eos
  rescue ConsumeError
    @area_code = "000"
    @middle_code = "000"
    @tail_code = "0000"
  end
end

ConsumeError = Class.new(StandardError)

class StateMachine
  def initialize(chars)
    @chars = chars.reverse
  end

  def consume_eos
    raise ConsumeError.new("phone number has too many chars") unless empty?
  end

  def consume(pattern, number, optional: false)
    (1..number).map do
      pop(pattern, optional: optional)
    end.reverse.join
  end

  def ignore(pattern)
    loop do
      break unless pop(pattern, optional: true)
    end
  end

  private

  attr_reader :chars

  def empty?
    chars.empty?
  end

  def pop(pattern, optional: false)
    head, *tail = chars

    if pattern.match?(chars.first)
      chars.shift
    elsif !optional
      raise ConsumeError.new("fail to consume '#{head}' with #{pattern}")
    end
  end
end
