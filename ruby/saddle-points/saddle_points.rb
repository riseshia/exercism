module MyArray
  refine Array do
    def indices(target)
      [].tap do |result|
        self.each_with_index { |val, idx| result << idx if val == target }
      end
    end
  end
end

using MyArray

class Matrix
  attr_reader :rows, :columns

  def initialize(str)
    @rows = build(str)
    @columns = @rows.transpose
  end

  def saddle_points
    col_indices_of_max & row_indices_of_min
  end

  private

  def build(str)
    str.split("\n").map { |row| row.split(' ').map(&:to_i) }
  end

  def col_indices_of_max
    @rows.
      map.with_index { |row, y| row.indices(row.max).map { |x| [y, x] } }.
      flatten(1)
  end

  def row_indices_of_min
    @columns.
      map.with_index { |col, x| col.indices(col.min).map { |y| [y, x] } }.
      flatten(1)
  end
end
