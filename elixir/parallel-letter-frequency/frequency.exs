defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t], pos_integer) :: map
  def frequency(texts, workers) do
    texts
    |> Enum.flat_map(fn(text) ->
      text
      |> String.downcase
      |> String.split("", trim: true)
      |> Enum.reject(&(Regex.match?(~r/[\s,1-9]/, &1)))
    end)
    |> Enum.reduce(%{}, fn(word, acc) ->
      value = Map.get(acc, word, 0)
      Map.put(acc, word, value + 1)
    end)
  end
end
