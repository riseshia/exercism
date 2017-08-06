class Proverb
  def initialize(*args, qualifier: nil)
    @args = args
    @qualifier = qualifier
  end

  def to_s
    head = @args.first
    phrases = @args.each_cons(2).map do |a, b|
      "For want of a #{a} the #{b} was lost."
    end
    phrases.push("And all for the want of a #{qualifier}#{head}.")
    phrases.join("\n")
  end

  private

  def qualifier
    @qualifier ? "#{@qualifier} " : ''
  end
end
