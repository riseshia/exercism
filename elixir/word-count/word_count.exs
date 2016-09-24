defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.split(~r{[\s,_:!&@$%^]+}, trim: true)
    |> Enum.reduce(%{}, fn(word, dic) -> update_dictionary(dic, word) end)
  end

  defp update_dictionary(dictionary, word) do
    count = Map.get(dictionary, word) || 0
    Map.put(dictionary, word, count + 1)
  end
end
