# SpaceAge
class SpaceAge
  attr_accessor :seconds

  EARTH_SECONDS = 31_557_600

  def initialize(seconds)
    self.seconds = seconds.to_f
  end

  {
    earth: 1,
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }.each do |name, relative_year|
    define_method("on_#{name}") do
      seconds / (relative_year * EARTH_SECONDS)
    end
  end
end
