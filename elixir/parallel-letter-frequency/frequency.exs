defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t], pos_integer) :: map
  def frequency(texts, workers) do
    texts
    |> map_texts(workers)
    |> Enum.map(fn(texts) -> Task.async(Frequency, :count_all, [texts]) end)
    |> Enum.map(&Task.await/1)
    |> Enum.reduce(%{}, &merge_map_with_plus/2)
  end

  def count_all(texts) do
    texts
    |> Enum.map(&count/1)
    |> Enum.reduce(%{}, &merge_map_with_plus/2)
  end

  defp count(text) do
    text
    |> cleaning
    |> Enum.reduce(%{}, fn(word, acc) ->
      value = Map.get(acc, word, 0) + 1
      Map.put(acc, word, value)
    end)
  end

  defp merge_map_with_plus(map1, map2) do
    Map.merge(map1, map2, fn(_key, v1, v2) -> v1 + v2 end)
  end

  defp cleaning(text) do
    text
    |> String.downcase
    |> String.split("", trim: true)
    |> Enum.reject(&(Regex.match?(~r/[\s,1-9]/, &1)))
  end

  defp map_texts(texts, workers) do
    0..(workers-1)
    |> Enum.map(
      &(Enum.drop(texts, &1) |> Enum.take_every(workers))
    )
  end
end
