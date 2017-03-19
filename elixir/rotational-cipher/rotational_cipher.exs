defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    curried_rotate_char = &(rotate_char(&1, shift))

    text
    |> String.graphemes
    |> Enum.map(curried_rotate_char)
    |> Enum.join
  end

  defp rotate_char(<<num>>, shift) when num in ?a..?z do
    <<rem(num - ?a + shift, 26) + ?a>>
  end
  defp rotate_char(<<num>>, shift) when num in ?A..?Z do
    <<rem(num - ?A + shift, 26) + ?A>>
  end
  defp rotate_char(<<char>>, shift), do: <<char>>
end

