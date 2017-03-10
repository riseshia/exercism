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

    lane.remove(pins)
    current_frame.roll(pins)
    finished_frames.last(2).map { |f| f.bonus_score(pins) }

    next_frame if current_frame.finished?
  end

  def score
    raise BowlingError.new('Game is not finished') unless finished?
    finished_frames.map(&:score).sum
  end

  private

  attr_writer :finished_frames, :current_frame, :lane

  def setup_frame
    self.current_frame = FrameFactory.of(finished_frames.size + 1)
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

# Lane
class Lane
  attr_reader :pins

  INIT_PINS = 10

  def initialize
    reset
  end

  def reset
    self.pins = INIT_PINS
  end

  def remove(removed_pins)
    raise Game::BowlingError.new('pins should be positive') \
      if removed_pins.negative?
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

module FrameFactory
  module_function

  def of(number)
    if number == 10
      FrameTen.new
    else
      Frame.new
    end
  end
end

# BaseFrame
class BaseFrame
  attr_reader :score, :roll_try, :judged

  def initialize
    self.roll_try = 0
    self.score = 0
  end

  def roll(pins)
    before_roll
    self.roll_try += 1
    self.score += pins
    judge
  end

  # Hook
  def before_roll; end

  # Override needed
  def bonus_score(pins); end

  # Override needed
  def finished?; end

  private

  attr_writer :score, :roll_try, :judged

  # Override needed
  def judge; end

  def strike?
    first_try? && defeat_all?
  end

  def spare?
    second_try? && defeat_all?
  end

  def nothing?
    second_try? && !defeat_all?
  end

  def first_try?
    roll_try == 1
  end

  def second_try?
    roll_try == 2
  end

  def defeat_all?
    score == 10
  end

  def needed_bonus
    if strike?
      2
    elsif spare?
      1
    elsif nothing?
      0
    end
  end
end

# Frame
class Frame < BaseFrame
  attr_reader :num_of_bonus

  def bonus_score(pins)
    if judged && num_of_bonus > 0
      self.score += pins
      self.num_of_bonus -= 1
    end
  end

  def finished?
    judged
  end
  private

  attr_writer :num_of_bonus

  def judge
    return if judged

    self.num_of_bonus = needed_bonus
    self.judged = !num_of_bonus.nil?
  end
end

# FrameTen
class FrameTen < BaseFrame
  attr_reader :bonus_roll

  def before_roll
    self.bonus_roll -= 1 if judged && bonus_roll > 0
  end

  def finished?
    judged && bonus_roll.zero?
  end

  private

  attr_writer :bonus_roll

  def judge
    return if judged

    self.bonus_roll = needed_bonus
    self.judged = !bonus_roll.nil?
  end
end

module BookKeeping
  VERSION = 3
end
