class Array
  def my_flatten
    inject([]) do |arr, val|
      next_arr = \
        if val.respond_to?(:my_flatten)
          val.my_flatten
        else
          [val].compact
        end
      arr.concat(next_arr)
    end
  end
end

module FlattenArray
  VERSION = 1

  module_function

  def flatten(array)
    # array.flatten.compact
    array.my_flatten
  end
end
