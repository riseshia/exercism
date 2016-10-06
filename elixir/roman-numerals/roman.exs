defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) when number >= 1000, do: "M"  <> numerals(number - 1000)
  def numerals(number) when number >=  900, do: "CM" <> numerals(number -  900)
  def numerals(number) when number >=  500, do: "D"  <> numerals(number -  500)
  def numerals(number) when number >=  400, do: "CD" <> numerals(number -  400)
  def numerals(number) when number >=  100, do: "C"  <> numerals(number -  100)
  def numerals(number) when number >=   90, do: "XC" <> numerals(number -   90)
  def numerals(number) when number >=   50, do: "L"  <> numerals(number -   50)
  def numerals(number) when number >=   40, do: "XL" <> numerals(number -   40)
  def numerals(number) when number >=   10, do: "X"  <> numerals(number -   10)
  def numerals(number) when number >=    9, do: "IX" <> numerals(number -    9)
  def numerals(number) when number >=    5, do: "V"  <> numerals(number -    5)
  def numerals(number) when number >=    4, do: "IV" <> numerals(number -    4)
  def numerals(number) when number >     1, do: "I"  <> numerals(number -    1)
  def numerals(1), do: "I"
  def numerals(0), do: ""
end
