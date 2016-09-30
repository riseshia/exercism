defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    sorted_base = normalize(base)

    candidates
    |> Enum.reject(&(String.downcase(base) == String.downcase(&1)))
    |> Enum.filter(&(matched?(sorted_base, &1)))
  end

  defp matched?(expected, candidate) do
    normalize(candidate) == expected
  end

  defp normalize(string) do
    string
    |> String.downcase
    |> String.codepoints
    |> Enum.sort
  end
end
