defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    ""
    |> pling(number)
    |> plang(number)
    |> plong(number)
    |> default(number)
  end
  
  defp pling(sound, number) when rem(number, 3) == 0, do: sound <> "Pling"
  defp pling(sound, _number), do: sound
  defp plang(sound, number) when rem(number, 5) == 0, do: sound <> "Plang"
  defp plang(sound, _number), do: sound
  defp plong(sound, number) when rem(number, 7) == 0, do: sound <> "Plong"
  defp plong(sound, _number), do: sound
  defp default(sound, number) when sound == "", do: to_string(number)
  defp default(sound, _number), do: sound
end
