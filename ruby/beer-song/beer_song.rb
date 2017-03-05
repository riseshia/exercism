class BeerSong
  def verses(start_num, finish_num)
    start_num.downto(finish_num).map { |i| verse(i) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end

  def verse(bottle_number)
    num = BottleNumberFactory.get_of(bottle_number)
    next_num = BottleNumberFactory.successor_of(bottle_number)

    "#{num.capitalize} of beer on the wall, #{num} of beer.\n" \
    "#{num.action}, #{next_num} of beer on the wall.\n"
  end
end

module BottleNumberFactory
  module_function

  def get_of(number)
    klass =
      case number
      when 0 then BottleNumberZero
      when 1 then BottleNumberOne
      else BottleNumber
      end
    klass.new(number)
  end

  def successor_of(number)
    get_of((number - 1) % 100)
  end
end

class BaseBottleNumber
  def initialize(number)
    self.number = number
  end

  def capitalize
    to_s.capitalize
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def pronoun
    "one"
  end

  def to_s
    "#{bottle_number} #{container}"
  end

  private

  attr_accessor :number

  def bottle_number
    number.to_s
  end

  def container
    "bottles"
  end
end

class BottleNumber < BaseBottleNumber
end

class BottleNumberZero < BaseBottleNumber
  def action
    "Go to the store and buy some more"
  end
  
  private

  def bottle_number
    "no more"
  end
end

class BottleNumberOne < BaseBottleNumber
  def pronoun
    "it"
  end

  private

  def container
    "bottle"
  end
end

module BookKeeping
  VERSION = 2
end
