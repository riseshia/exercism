module Year
  module_function

  def leap?(year)
    divided_by_4 = (year % 4).zero?
    divided_by_16 = (year % 16).zero?
    divided_by_100 = (year % 100).zero?

    divided_by_100 ? divided_by_16 : divided_by_4
  end
end

module BookKeeping
  VERSION = 2
end
