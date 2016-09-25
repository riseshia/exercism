defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r{\s|.(?=[A-Z])})
    |> Enum.map(&String.first/1)
    |> Enum.join
    |> String.upcase
  end
end
