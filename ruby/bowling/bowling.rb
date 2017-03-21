# Bowling game simulation
class Game
  attr_accessor :logged_frames, :current_frame

  BowlingError = Class.new(StandardError)
  PIN_MIN = 0
  PIN_MAX = 10
  FRAME_MAX = 10

  def initialize
    self.logged_frames = []
    self.current_frame = []
  end

  def roll(pins)
    raise(BowlingError, "Not accepted: #{pins}") unless (PIN_MIN..PIN_MAX).cover?(pins)
    raise(BowlingError, 'Game is finished') if game_finished?
    raise(BowlingError, 'this frame is not valid') unless frame_valid?(pins)

    current_frame << pins

    if frame_finished?
      logged_frames << current_frame
      self.current_frame = []
    end
  end

  def score
    raise(BowlingError, 'Game is not finished') unless game_finished?
    0.upto(9).map { |i| score_of_frame(i) }.sum
  end

  private

  def frame_valid?(pins)
    PIN_MAX - (current_frame.sum % PIN_MAX) >= pins
  end

  def last_frame?
    logged_frames.size == (FRAME_MAX - 1)
  end

  def game_finished?
    logged_frames.size == FRAME_MAX
  end

  def frame_finished?
    if last_frame?
      (rolled?(2) && !(strike?(current_frame) || spare?(current_frame))) \
        || rolled?(3)
    else
      strike?(current_frame) || rolled?(2)
    end
  end

  def rolled?(number)
    current_frame.size == number
  end

  def score_of_frame(idx)
    frame = logged_frames[idx]

    if strike?(frame)
      score_with_bonus(logged_frames[idx, 3])
    elsif spare?(frame)
      score_with_bonus(logged_frames[idx, 2])
    else
      frame.sum
    end
  end

  def score_with_bonus(frames)
    frames.flatten[0, 3].sum
  end

  def strike?(frame)
    frame.size >= 1 && frame.first == 10
  end

  def spare?(frame)
    frame.size >= 2 && frame.first < 10 && frame.first + frame[1] == 10
  end
end

module BookKeeping
  VERSION = 3
end
