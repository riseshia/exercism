class PhoneNumber
  attr_reader :area_code

  PHONE_NUMBER_PATTERN = /^1?\D*(\d{3})\D*(\d{3})\D*(\d{4})$/

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
    matched = PHONE_NUMBER_PATTERN.match(phone_number)

    if matched
      _, @area_code, @middle_code, @tail_code = matched.to_a
    else
      setup_dummy_code
    end
  end

  def setup_dummy_code
    @area_code = "000"
    @middle_code = "000"
    @tail_code = "0000"
  end
end
