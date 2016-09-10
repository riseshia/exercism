module Gigasecond
  module_function

  GIGASECOND = 1_000_000_000

  def from(time)
    time + GIGASECOND
  end
end

module BookKeeping
  VERSION = 3
end
