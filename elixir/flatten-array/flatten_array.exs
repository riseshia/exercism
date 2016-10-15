defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten([]), do: []
  def flatten([h|t]) when is_list(h), do: flatten(h) ++ flatten(t)
  def flatten([nil|t]), do: flatten(t)
  def flatten([h|t]), do: [h|flatten(t)]
end
