defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    check_brackets?(str, [])
  end

  @open_brackets ["[", "{", "("]
  @close_brackets ["]", "}", ")"]
  @brackets %{"[" => "]", "{" => "}", "(" => ")"}
  defp check_brackets?("", []), do: true
  defp check_brackets?("", _), do: false
  defp check_brackets?(<<open_bracket::binary-size(1), rest::binary>>, stack)
    when open_bracket in @open_brackets do
    check_brackets?(rest, [open_bracket | stack])
  end

  defp check_brackets?(<<close_bracket::binary-size(1), _::binary>>, [])
    when close_bracket in @close_brackets, do: false
  defp check_brackets?(<<close_bracket::binary-size(1), rest::binary>>, [open_bracket | stack])
    when close_bracket in @close_brackets do
    if @brackets[open_bracket] == close_bracket do
      check_brackets?(rest, stack) # POP
    else
      false
    end
  end

  defp check_brackets?(<<_::binary-size(1), rest::binary>>, stack) do
    check_brackets?(rest, stack) # IGNORE
  end
end
