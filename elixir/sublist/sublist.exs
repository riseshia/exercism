defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a_list, b_list) do
    a_length = length(a_list)
    b_length = length(b_list)
    cond do
      a_length == b_length -> equal(a_list, b_list)
      a_length < b_length -> sublist(a_list, b_list)
      true -> superlist(a_list, b_list)
    end
  end

  defp equal(a_list, b_list) when a_list == b_list, do: :equal
  defp equal(_, _), do: :unequal

  defp sublist(a_list, b_list) do
    if sublist?(a_list, b_list), do: :sublist, else: :unequal
  end
  defp superlist(a_list, b_list) do
    if superlist?(a_list, b_list), do: :superlist, else: :unequal
  end

  defp sublist?([], _), do: true
  defp sublist?(_, []), do: false
  defp sublist?(a_list, b_list) when length(a_list) > length(b_list), do: false
  defp sublist?([head|a_tail], [head|b_tail]) do
    matched?(a_tail, b_tail) || sublist?([head|a_tail], b_tail)
  end
  defp sublist?(a_list, [_|b_tail]) do
    sublist?(a_list, b_tail)
  end

  defp superlist?(_, []), do: true
  defp superlist?([], _), do: false
  defp superlist?(a_list, b_list) when length(a_list) < length(b_list), do: false
  defp superlist?([head|a_tail], [head|b_tail]) do
    matched?(a_tail, b_tail) || superlist?(a_tail, [head|b_tail])
  end
  defp superlist?([_|a_tail], b_list) do
    superlist?(a_tail, b_list)
  end

  defp matched?([], []), do: true
  defp matched?(_, []), do: true
  defp matched?([], _), do: true
  defp matched?([head|a_tail], [head|b_tail]), do: matched?(a_tail, b_tail)
  defp matched?(_, _), do: false
end
