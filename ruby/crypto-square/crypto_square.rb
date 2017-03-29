# Crypto
class Crypto
  attr_reader :normalize_plaintext
  def initialize(target)
    @normalize_plaintext = target.downcase.gsub(/\W/, '')
  end

  def plaintext_segments
    string = normalize_plaintext
    (0...string.size).step(size).map { |i| string[i, size] }
  end

  def ciphertext
    ciphertext_segments.join
  end

  def normalize_ciphertext
    ciphertext_segments.join(' ')
  end

  def size
    Math.sqrt(normalize_plaintext.size).ceil
  end

  private

  def ciphertext_segments
    rows = plaintext_segments.map(&:chars)
    add_padding_to_last_row(rows)
    rows.transpose.map(&:join)
  end

  def add_padding_to_last_row(rows)
    first_row_size = rows.first.size
    last_row_size = rows.last.size
    return if first_row_size == last_row_size

    diff_size = first_row_size - last_row_size
    diff_size.times { rows.last << '' }
  end
end
