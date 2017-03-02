class Array
  def keep
    raise "Give me block!" unless block_given?
    new_array = self.class.new

    each_with_object(new_array) do |e, arr|
      new_array << e if yield(e)
    end
  end

  def discard(&block)
    keep { |e| !yield(e) }
  end
end
