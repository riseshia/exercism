# Bowling game simulation
class Game
  attr_reader :finished_frames, :current_frame, :lane

  BowlingError = Class.new(StandardError)

  def initialize
    self.finished_frames = []
    self.lane = Lane.new
    setup_frame
  end

  def roll(pins)
    raise BowlingError.new('Game is finished') if finished?
    raise BowlingError.new('pins should be positive') if pins.negative?
    lane.remove(pins)
    current_frame.roll(pins)
    finished_frames.last(2).map { |r| r.bonus_score(pins) }

    next_frame if current_frame.finished?
  end

  def score
    raise BowlingError.new('Game is not finished') unless finished?
    finished_frames.map(&:score).sum
  end

  private

  attr_writer :finished_frames, :current_frame, :lane

  def setup_frame
    self.current_frame = Frame.new(finished_frames.size + 1)
    lane.reset
  end

  def next_frame
    finished_frames << current_frame
    setup_frame unless finished?
  end

  def finished?
    finished_frames.size == 10
  end
end

class Lane
  attr_reader :pins

  INIT_PINS = 10

  def initialize
    self.pins = INIT_PINS
  end

  def reset
    self.pins = INIT_PINS
  end

  def remove(removed_pins)
    self.pins -= removed_pins

    if pins.negative?
      raise Game::BowlingError.new('remaining pins cannot be negative')
    elsif pins.zero?
      reset
    end
  end

  private

  attr_writer :pins
end

# Frame
class Frame
  attr_reader :score, :roll_try, :bonus, :number

  def initialize(number)
    self.number = number
    self.roll_try = 0
    self.score = 0
  end

  def roll(pins)
    self.roll_try += 1
    self.score += pins
    if number == 10 && bonus
      self.bonus -= 1
    end
    judge
  end

  def bonus_score(pins)
    if bonus.nonzero?
      self.score += pins
      self.bonus -= 1
    end
  end

  def finished?
    if number != 10
      bonus
    else
      bonus && bonus.zero?
    end
  end

  private

  attr_writer :score, :roll_try, :bonus, :number

  def judge
    return if bonus
    self.bonus =
      if strike?
        2
      elsif spare?
        1
      elsif nothing?
        0
      end
  end

  def strike?
    roll_try == 1 && score == 10
  end

  def spare?
    roll_try == 2 && score == 10
  end

  def nothing?
    roll_try == 2 && score < 10
  end
end

module BookKeeping
  VERSION = 3
end
