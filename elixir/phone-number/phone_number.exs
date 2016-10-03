defmodule Phone do
  @digit ~w{0 1 2 3 4 5 6 7 8 9}
  @consume_chars ["(", ")", "-", ".", " "]
  @format_regex ~r/(\d{3})(\d{3})(\d{4})/

  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    raw
    |> filter_number
    |> consume_first_one
    |> validate
  end

  defp filter_number(""), do: ""
  defp filter_number(<<head::binary-size(1), rest::binary>>) when head in @digit do
    head <> filter_number(rest)
  end
  defp filter_number(<<head::binary-size(1), rest::binary>>) when head in @consume_chars do
    filter_number(rest)
  end
  defp filter_number(<<_::binary-size(1), rest::binary>>) do
    "0" <> filter_number(rest)
  end

  defp consume_first_one(raw) do
    if String.length(raw) == 11 and String.first(raw) == "1" do
      <<head::binary-size(1), rest::binary>> = raw
      rest
    else
      raw
    end
  end

  defp validate(raw) do
    if String.length(raw) == 10 do
      raw
    else
      "0000000000"
    end
  end

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    raw
    |> number
    |> String.slice(0, 3)
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    pure = number(raw)
    [[_, area_code, middle, rest]] = Regex.scan(@format_regex, pure)

    "(#{area_code}) #{middle}-#{rest}"
  end
end
