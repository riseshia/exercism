module Brackets
  module_function

  BRACKETS = {
    '[' => ']',
    '{' => '}',
    '(' => ')'
  }.freeze

  def open_brackets?(char)
    BRACKETS.keys.include?(char)
  end

  def close_brackets?(char)
    BRACKETS.values.include?(char)
  end

  def paired?(str)
    recursive_paired?([], str.chars)
  end

  def recursive_paired?(stack, chars)
    return stack.empty? if chars.empty?
    char, *remained = chars

    case
    when open_brackets?(char) then stack.push(char)
    when !close_brackets?(char) # skip char
    when matched?(stack.last, char) then stack.pop
    else
      return false
    end
    recursive_paired?(stack, remained)
  end

  def matched?(open, close)
    BRACKETS[open] == close
  end
end

module BookKeeping
  VERSION = 4
end
