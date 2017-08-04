class Matrix
  attr_reader :rows, :columns

  def initialize(str)
    @rows = build(str)
    @columns = @rows.transpose
  end

  private

  def build(str)
    str.split("\n").map { |row| row.split(' ').map(&:to_i) }
  end
end
