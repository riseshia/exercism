class MapperGenerater
  def backward(cipher, number_of_rail)
    size = cipher.size

    mapper = generate_map(size, number_of_rail)
    Array.new(size).tap do |raw|
      mapper.each_with_index do |dest_idx, from_idx|
        raw[dest_idx] = cipher[from_idx]
      end
    end.join("")
  end

  def forward(raw, number_of_rail)
    size = raw.size

    mapper = generate_map(size, number_of_rail)
    Array.new(size).tap do |cipher|
      mapper.each_with_index do |from_idx, dest_idx|
        cipher[dest_idx] = raw[from_idx]
      end
    end.join("")
  end

  private

  def pattern(number_of_rail)
    (0..(number_of_rail - 1)).to_a + (1..(number_of_rail - 2)).to_a.reverse
  end

  def generate_map(size, number_of_rail)
    raw = (0...size).to_a
    rails = Array.new(number_of_rail) { [] }
    rail_idxs = pattern(number_of_rail).cycle.first(size)
    rail_idx = 0

    raw.zip(rail_idxs).each do |pos_idx, rail_idx|
      rails[rail_idx] << pos_idx
    end
    rails.flatten
  end
end

module RailFenceCipher
  VERSION = 1

  module_function

  def encode(raw, number_of_rail)
    MapperGenerater.new.forward(raw, number_of_rail)
  end

  def decode(cipher, number_of_rail)
    MapperGenerater.new.backward(cipher, number_of_rail)
  end
end
