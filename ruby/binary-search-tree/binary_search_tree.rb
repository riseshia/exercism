# Bst
class Bst
  VERSION = 1

  attr_accessor :data, :left, :right

  def initialize(data)
    self.data = data
    self.left = nil
    self.right = nil
  end

  def insert(new_data)
    if new_data > data
      insert_right(new_data)
    else
      insert_left(new_data)
    end
  end

  def each(&block)
    if block_given?
      traverse(&block)
    else
      arr = []
      each { |e| arr << e }
      arr.to_enum
    end
  end

  def traverse(&block)
    left.traverse(&block) if left
    yield(data)
    right.traverse(&block) if right
  end

  private

  [:left, :right].each do |dir|
    define_method("insert_#{dir}") do |new_data|
      dir_data = send(dir)
      if dir_data
        dir_data.insert(new_data)
      else
        send("#{dir}=", self.class.new(new_data))
      end
    end
  end
end
