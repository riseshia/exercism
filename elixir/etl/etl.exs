defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(map) :: map
  def transform(input) do
    Enum.reduce(input, %{}, fn({key, values}, acc) ->
      destruct_list(values, acc, key)
    end)
  end
  
  defp destruct_list(list, dictionary, value) do
    Enum.reduce(list, dictionary, fn(el, dic) ->
      downcased= String.downcase(el)
      Map.put(dic, downcased, value)
    end)
  end
end
