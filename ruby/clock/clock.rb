class Clock
  def initialize(min)
    @min = min
  end

  def self.at(hour, min)
    total_min = hour * 60 + min
    new(total_min)
  end

  def to_s
    hour = (@min / 60) % 24
    min = @min % 60
    "#{hour.to_s.rjust(2, '0')}:#{min.to_s.rjust(2, '0')}"
  end

  def +(min_amount)
    self.class.new(@min + min_amount)
  end

  def ==(other)
    return false unless other.class == Clock
    to_s == other.to_s
  end
end

module BookKeeping
  VERSION = 2
end
