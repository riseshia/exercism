module RunLengthEncoding
  module_function

  def encode(string)
    encoded = ""
    loop do
      break if string.empty?
      next_string, char, count = encode_consume(string)
      encoded += encode_string(count, char)
      string = next_string
    end

    encoded
  end

  def decode(string)
    decoded = ""

    loop do
      break if string.empty?
      next_string, char, count = decode_consume(string)
      decoded += decode_string(count, char)
      string = next_string
    end

    decoded
  end

  def encode_string(count, char)
    count != 1 ? "#{count}#{char}" : char
  end

  def encode_consume(string)
    char = string[0]
    next_string = string.sub(/(.)\1*/, "")
    [next_string, char, string.size - next_string.size]
  end

  def decode_string(count, char)
    char * count
  end

  def decode_consume(string)
    matched = string.match(/(\d*)(.)/)
    count = matched[1].empty? ? 1 : matched[1]
    char = matched[2]
    next_string = string.sub(/\d*./, "")
    [next_string, char, count.to_i]
  end
end

module BookKeeping
  VERSION = 2
end
