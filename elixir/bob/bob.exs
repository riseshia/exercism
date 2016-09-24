defmodule Bob do
  def hey(input) do
    cond do
      String.trim(input) == "" -> "Fine. Be that way!"
      String.ends_with?(input, "?") -> "Sure."
      String.match?(input, ~r/[A-Z]/) and
        String.upcase(input) == input -> "Whoa, chill out!"
      !String.match?(input, ~r/[a-zA-Z0-9\s]/) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
