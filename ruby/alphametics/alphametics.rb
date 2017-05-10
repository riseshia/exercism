module Helper
  module_function

  def test_expr?(exprs, rem, allow_zero = true)
    exprs = exprs.map { |val| val.to_i.to_s } if allow_zero
    *left, right = exprs
    template = "(#{left.join(' + ')}) % #{rem} == #{right} % #{rem}"
    return false if template.match?(/(?:(\(|\s))0\d+/)

    eval(template) ? true : false
  end
end

module Alphametics
  module_function

  def solve(template)
    left, right = template.split(" == ")
    args = left.split(" + ")
    max_length = (args + [right]).max_by { |word| word.size }.size
    vars = template.gsub(/[\s+=]/, "").chars.uniq.sort
    var_length = vars.size

    possibilities = [Array.new(var_length)]
    keys = nil

    0.upto(max_length - 1) do |i|
      possibilities = step_by_solve(
        vars, args, right, i, max_length - 1, possibilities
      )

      return {} if possibilities.empty?
    end

    vars.zip(possibilities.first).to_h
  end

  def manipulate_possibilities(possibilities, full_vars, target_vars)
    new_possibilities = possibilities
    target_vars.each do |var|
      tmp = []
      idx = full_vars.index(var)
      next if new_possibilities.first[idx]

      new_possibilities.each do |pos|
        0.upto(9).each do |i|
          if pos.index(i).nil?
            new_pos = pos.clone
            new_pos[idx] = i
            tmp << new_pos
          end
        end
      end
      new_possibilities = tmp
    end
    new_possibilities
  end

  def step_by_solve(vars, args, right, idx, last_idx, possibilities)
    last_digit = idx == last_idx

    target_left = args.map { |arg| arg.reverse[0..idx].reverse }
    target_right = right.reverse[0..idx].reverse
    target_vars = (target_left.join("") + target_right).chars.uniq.sort
    possibilities = manipulate_possibilities(possibilities, vars, target_vars)

    rem = 10 ** (idx + 1)

    possibilities.select do |possibility|
      dic = vars.zip(possibility).to_h

      exprs = [*target_left, target_right].map do |el|
        el.gsub(/[A-Z]/) do |matched|
          dic[matched]
        end
      end
      Helper.test_expr?(exprs, rem, !last_digit)
    end
  end
end

module BookKeeping
  VERSION = 4
end
