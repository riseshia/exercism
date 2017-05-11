module MyFlatten
  refine Array do
    def my_flatten
      self.inject([]) do |arr, val|
        arr.concat(val.my_flatten)
      end
    end
  end

  refine Integer do
    def my_flatten
      [self]
    end
  end

  refine NilClass do
    def my_flatten
      []
    end
  end
end

using MyFlatten

module FlattenArray
  VERSION = 1

  module_function

  def flatten(array)
    # array.flatten.compact
    array.my_flatten
  end
end
