# Bst
class Bst
  VERSION = 1

  attr_reader :data, :left, :right

  def initialize(data)
    self.data = data
    self.left = self.right = EmptyNode.instance
  end

  def insert(new_data)
    if new_data > data
      insert_right(new_data)
    else
      insert_left(new_data)
    end
  end

  def each(&block)
    return enum_for(:each) unless block_given?

    left.each(&block)
    yield(data)
    right.each(&block)

    self
  end

  protected

  def data?
    true
  end

  private

  attr_writer :data, :left, :right

  def insert_left(new_data)
    if left.data?
      left.insert(new_data)
    else
      self.left = self.class.new(new_data)
    end
  end

  def insert_right(new_data)
    if right.data?
      right.insert(new_data)
    else
      self.right = self.class.new(new_data)
    end
  end

  # Empty Leaf node
  class EmptyNode
    def self.instance
      @_instance ||= new
    end

    def each(&block); end

    def data?
      false
    end
  end

  private_constant :EmptyNode
end
