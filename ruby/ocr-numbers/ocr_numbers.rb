class OcrNumbers
  PATTERN = {
    " _ \n| |\n|_|\n   " => '0',
    "   \n  |\n  |\n   " => '1',
    " _ \n _|\n|_ \n   " => '2',
    " _ \n _|\n _|\n   " => '3',
    "   \n|_|\n  |\n   " => '4',
    " _ \n|_ \n _|\n   " => '5',
    " _ \n|_ \n|_|\n   " => '6',
    " _ \n  |\n  |\n   " => '7',
    " _ \n|_|\n|_|\n   " => '8',
    " _ \n|_|\n _|\n   " => '9',
  }.freeze
  GARBLE = '?'

  def self.convert(text)
    new.convert(text)
  end

  def convert(text)
    lines = text.split("\n").each_slice(4)
    lines.each { |line| valid!(line) }
    lines.map { |line| recognize_line(line) }.join(',')
  end

  private

  def recognize_line(line)
    to_digits(line).map { |pattern| PATTERN[pattern] || GARBLE }.join
  end

  def to_digits(rows)
    head, *tail = rows.map { |row| tokenize(row) }
    head.zip(*tail).map { |digit| digit.join("\n") }
  end

  def tokenize(line)
    line.chars.each_slice(3).map(&:join)
  end

  def valid!(rows)
    base_size = rows.first.size
    return if rows.size % 4 == 0 &&
              rows.all? { |line| line.size == base_size } &&
              base_size % 3 == 0
    raise ArgumentError.new
  end
end

module BookKeeping
  VERSION = 1
end
