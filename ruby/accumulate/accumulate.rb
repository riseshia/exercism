class Array
  def accumulate(&block)
    idx = 0
    result_array = []
    loop do
      return result_array if idx == size
      result_array << block.call(at(idx))
      idx += 1
    end
  end
end
