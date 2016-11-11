class Series
  attr_reader :num_arr
  def initialize(num_str)
    @num_arr = num_str.split("").map(&:to_i)
  end

  def slices(num)
    raise ArgumentError, "It's too large" if num_arr.size < num

    last_idx = num_arr.size - num
    (0..last_idx).map do |idx|
      num_arr[idx, num]
    end
  end
end
