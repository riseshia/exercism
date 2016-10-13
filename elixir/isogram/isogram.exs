defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence, consumed \\ %{})
  def isogram?("", _), do: true
  def isogram?(sentence, consumed) do
    char = String.first(sentence)
    tail = String.slice(sentence, 1..-1)

    cond do
      char in ["-", " "] -> isogram?(tail, consumed)
      consumed[char] -> false
      true -> isogram?(tail, Map.put(consumed, char, true))
    end
  end
end
