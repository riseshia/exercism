defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @weeknum %{monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6, sunday: 7}
  @teenth_start 13

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    start_day = start_day(year, month, schedule)
    day = find_weekday_since(year, month, start_day, weekday) 
    {year, month, day}
  end

  defp find_weekday_since(year, month, day, weekday) do
    if :calendar.day_of_the_week({year, month, day}) == @weeknum[weekday] do
       day
    else
       find_weekday_since(year, month, day + 1, weekday)
    end
  end

  defp start_day(year, month, schedule) do
    case schedule do
      :first  -> 1
      :second -> 8
      :teenth -> 13
      :third  -> 15
      :fourth -> 22
      :last   -> :calendar.last_day_of_the_month(year, month) - 6
    end
  end
end
