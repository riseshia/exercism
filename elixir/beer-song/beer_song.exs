defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t
  def verse(number) do
    before_number = number - 1
    after_number = number - 2

    """
    #{describe(before_number)}
    #{take_action(before_number)}, #{bottles_on_the_wall(after_number)}.
    """
  end

  defp describe(number) do
    "#{String.capitalize(bottles_on_the_wall(number))}, #{bottles(number)}."
  end

  defp bottles_on_the_wall(number) do
    "#{bottles(number)} on the wall"
  end

  defp take_action(0) do
    "Go to the store and buy some more"
  end
  defp take_action(number) do
    "Take #{grep_from(number)} down and pass it around"
  end

  defp bottles(number), do: "#{remained(number)} #{unit(number)} of beer"

  defp remained(-1), do: 99 
  defp remained(0), do: "no more"
  defp remained(number), do: number

  defp unit(1), do: "bottle"
  defp unit(_), do: "bottles"

  defp grep_from(1), do: "it"
  defp grep_from(_), do: "one"

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t) :: String.t
  def lyrics(range \\ 100..1) do
    range
    |> Enum.map(&(BeerSong.verse(&1)))
    |> Enum.join("\n")
  end
end
