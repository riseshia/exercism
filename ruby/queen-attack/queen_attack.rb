class Queens
  def initialize(white: nil, black: nil)
    @white = Piece.new(white) if white
    @black = Piece.new(black) if black
  end

  def attack?
    raise "Require white, black" unless @white && @black

    @white.attack?(@black)
  end
end

class Piece
  attr_reader :x, :y

  def initialize(pos)
    validate!(pos)
    @x, @y = pos
  end

  def attack?(other)
    x == other.x || y == other.y || (x - other.x).abs == (y - other.y).abs
  end

  private

  def validate!(pos)
    pos.each do |d|
      raise ArgumentError.new("Invalid Position") unless (0..7).include?(d)
    end
  end
end

module BookKeeping
  VERSION = 2
end
