class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    day = Date.new(@year, @month, start_with(schedule))
    method = "#{weekday}?"

    find_day(day, method)
  end

  private

  def find_day(day, method)
    day.send(method) ? day : find_day(day.next_day, method)
  end

  def start_with(schedule)
    case schedule
    when :teenth then 13
    when :first then 1
    when :second then 8
    when :third then 15
    when :fourth then 22
    when :last then last_week_start
    end
  end

  def last_week_start
    Date.new(@year, @month, 1).next_month.prev_day.day - 6
  end
end
