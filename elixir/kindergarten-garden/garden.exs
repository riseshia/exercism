defmodule Garden do
  @default_student_names [:alice, :bob, :charlie, :david,
                          :eve, :fred, :ginny, :harriet,
                          :ileana, :joseph, :kincaid, :larry]
  @plant_index %{"R" => :radishes, "C" => :clover, "G" => :grass, "V" => :violets}
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @default_student_names)
  def info(info_string, student_names) do
    [first_row, second_row] = info_string |> build_list
    zip_and_reduce(first_row, second_row, Enum.sort(student_names), %{})
  end

  defp build_list(string) do
    string
    |> String.split("\n")
    |> Enum.map(fn(row) ->
      row 
      |> String.codepoints
      |> transform
    end)
  end

  defp transform([]), do: []
  defp transform([plant_str|tail]) do
    [@plant_index[plant_str] | transform(tail)]
  end

  defp zip_and_reduce([], [], [], acc), do: acc
  defp zip_and_reduce([], [], [name|rest_names], acc) do
    zip_and_reduce([], [], rest_names, Map.put(acc, name, {}))
  end
  defp zip_and_reduce([a, b|first_tail], [c, d|second_tail],
                      [name|rest_names], acc) do
    zip_and_reduce(first_tail, second_tail,
                   rest_names, Map.put(acc, name, {a, b, c, d}))
  end
end
