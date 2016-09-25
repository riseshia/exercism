defmodule RunLengthEncoder do
  @encode_reg ~r{(\w)\1*}
  @decode_reg ~r{(\d+)([A-Z]+)}

  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    Regex.scan(@encode_reg, string)
    |> Enum.map(&compress/1)
    |> Enum.join
  end

  defp compress([single_char_string, char]) do
    matched_length = String.length(single_char_string)
    "#{matched_length}#{char}"
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(@decode_reg, string)
    |> Enum.map(&expand/1)
    |> Enum.join
  end

  defp expand([_all, count, char]) do
    String.duplicate(char, String.to_integer(count))
  end
end
