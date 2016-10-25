class Bob
  def hey(message)
    if message.strip.empty?
      "Fine. Be that way!"
    elsif message.upcase != message.downcase && message == message.upcase
      "Whoa, chill out!"
    elsif message.end_with?("?")
      "Sure."
    else
      "Whatever."
    end
  end
end
