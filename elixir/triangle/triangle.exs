defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }
  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0 do
    { :error, "all side lengths must be positive" }
  end
  def kind(a, b, c) do
    if triangle_inequality?(a, b, c) do
      judge(a, b, c)
    else
      { :error, "side lengths violate triangle inequality" }
    end
  end

  defp triangle_inequality?(a, b, c) do
    [side1, side2, side3] = [a, b, c] |> Enum.sort
    side1 + side2 > side3
  end

  defp judge(a, a, a), do: { :ok, :equilateral }
  defp judge(a, a, _), do: { :ok, :isosceles }
  defp judge(a, _, a), do: { :ok, :isosceles }
  defp judge(_, a, a), do: { :ok, :isosceles }
  defp judge(_, _, _), do: { :ok, :scalene }
end
