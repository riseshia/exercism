module Helper
  module_function

  def test_expr?(expr)
    return false if expr.match?(/(?:(^|\s))0\d*/)

    eval(expr) ? true : false
  rescue SyntaxError
    false
  end
end

module Alphametics
  module_function

  def solve(template)
    digits = template.gsub(/[\s+=]/, "").chars.uniq

    for s in (0..9).to_a.permutation(digits.size) do
      dic = digits.zip(s).to_h
      expr = template.gsub(/[^\s+=]/) do |matched|
        dic[matched]
      end

      return dic if Helper.test_expr?(expr)
    end

    {}
  end
end

module BookKeeping
  VERSION = 4
end
