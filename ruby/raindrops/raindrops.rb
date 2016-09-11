module Raindrops
  module_function

  # [enabled_factor, sound]
  NUMBER_TO_SOUND = [
    [3, "Pling"],
    [5, "Plang"],
    [7, "Plong"]
  ]

  def convert(number)
    sounds = NUMBER_TO_SOUND.inject("") do |tmp_string, (factor, sound)|
      number % factor == 0 ? tmp_string + sound : tmp_string
    end
    
    sounds.empty? ? number.to_s : sounds
  end
end

module BookKeeping
  VERSION = 2
end
