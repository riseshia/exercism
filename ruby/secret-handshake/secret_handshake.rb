class SecretHandshake
  HANDSHAKE = ['wink', 'double blink', 'close your eyes', 'jump'].freeze

  attr_reader :commands

  def initialize(number)
    @commands = []
    return unless number.is_a? Integer
    HANDSHAKE.each do |shake|
      @commands << shake if marked?(number)
      number >>= 1
    end
    @commands.reverse! if marked?(number)
  end

  private

  def marked?(number)
    number % 2 == 1
  end
end
