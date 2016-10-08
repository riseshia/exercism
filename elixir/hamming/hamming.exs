defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
    hamming_distance(0, strand1, strand2)
  end

  defp hamming_distance(count, [], []), do: {:ok, count}
  defp hamming_distance(count, [], _), do: {:error,  "Lists must be the same length"}
  defp hamming_distance(count, _, []), do: {:error, "Lists must be the same length"}
  defp hamming_distance(count, [char|rest1], [char|rest2]) do
    hamming_distance(count, rest1, rest2)
  end
  defp hamming_distance(count, [_|rest1], [_|rest2]) do
     hamming_distance(count + 1, rest1, rest2)
  end
end
