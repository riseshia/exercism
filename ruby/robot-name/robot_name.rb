require "set"

class Robot
  attr_reader :name

  def initialize
    randomize_name
  end

  def reset
    randomize_name
  end

  private

  def randomize_name
    @name = unique_name
  end

  GENERATED_NAME = Set.new
  def unique_name
    loop do
      new_name = generate_random_name
      unless GENERATED_NAME.include?(new_name)
        GENERATED_NAME.add(new_name)
        return new_name
      end
    end 
  end

  def generate_random_name
    rand_char * 2 + rand_num * 3
  end

  def rand_num
    rand(10).to_s
  end

  UPPER_CASE = ("A".."Z").to_a
  def rand_char
    UPPER_CASE[rand(UPPER_CASE.size)]
  end
end

module BookKeeping
  VERSION = 2
end
