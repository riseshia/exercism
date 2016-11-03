module RunLengthEncoding
  module_function

  def encode(string)
    encoded = ""
    next_idx = 0

    loop do
      break if next_idx >= string.size
      next_idx, char, count = encode_consume(string, next_idx)
      encoded << encode_string(count, char)
    end

    encoded
  end

  def decode(string)
    decoded = ""

    loop do
      break if string.empty?
      next_string, char, count = decode_consume(string)
      decoded << decode_string(count, char)
      string = next_string
    end

    decoded
  end

  class << self
    def encode_string(count, char)
      count != 1 ? "#{count}#{char}" : char
    end

    def encode_consume(string, idx)
      char = string[idx]
      pointer = idx + 1
      loop do
        break unless string[pointer] == char
        pointer += 1
      end

      [pointer, char, pointer - idx]
    end

    def decode_string(count, char)
      char * count
    end

    def decode_consume(string)
      matched = string.match(/(?<num_of_char>\d*)(?<char>.)/)
      count = matched[:num_of_char].empty? ? 1 : matched[:num_of_char]
      char = matched[:char]
      next_string = string.sub(/\d*./, "")
      [next_string, char, count.to_i]
    end
  end
end

module BookKeeping
  VERSION = 2
end
