class CSP
  def initialize(vars, range)
    @vars = vars
    @range = range
    @candidates = [Array.new(vars.size)]
  end

  def add(constraint)
    solve_cons(constraint)
  end

  def solve
    return {} if @candidates.empty?
    @vars.zip(@candidates.first).to_h
  end

  private

  def manipulate_candidates(cons)
    return if @candidates.empty?
    target_vars = cons.gsub(/[^A-Z]+/, "").chars.uniq.sort

    target_vars.each do |var|
      tmp = []
      idx = @vars.index(var)
      next if @candidates.first[idx]

      @candidates.each do |pos|
        @range.each do |i|
          if pos.index(i).nil?
            new_pos = pos.clone
            new_pos[idx] = i
            tmp << new_pos
          end
        end
      end
      @candidates = tmp
    end
  end

  def solve_cons(cons)
    manipulate_candidates(cons)

    @candidates = @candidates.select do |candidate|
      dic = @vars.zip(candidate).to_h

      expr = cons.
               gsub(/[A-Z]/) { |matched| dic[matched] }.
               gsub(/[0-9]+/) { |matched| matched.to_i.to_s }
      eval(expr)
    end
  end
end

module Alphametics
  module_function

  def split_problem(template)
    vars = template.split(/[\s+=]+/)
    max_length = vars.max_by { |word| word.size }.size

    cons = []
    0.upto(max_length - 1) do |delta|
      *left, right = vars.map { |var| var.reverse[0..delta].reverse }

      rem = 10 ** (delta + 1)
      con = "(#{left.join(' + ')}) % #{rem} == #{right} % #{rem}"
      cons << con
    end
    cons
  end

  def solve(template)
    vars = template.gsub(/[\s+=]/, "").chars.uniq.sort
    csp = CSP.new(vars, (0..9).to_a)

    cons = split_problem(template)
    cons.last.scan(/[A-Z]+/).each do |var|
      csp.add("#{var[0]} != 0")
    end

    cons.each do |cons|
      csp.add(cons)
    end
    csp.solve
  end
end

module BookKeeping
  VERSION = 4
end
