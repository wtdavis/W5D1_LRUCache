class MaxIntSet

  attr_reader :store

  def initialize(max)
    @store = Array.new(max)
  end

  def insert(num)
    if is_valid?(num)
      @store[num] = true
    else
      raise "out of bounds"
    end
  end

  def remove(num)
    if is_valid?(num)
      @store[num] = false
    else
      raise "out of bounds"
    end
  end

  def include?(num)
    if is_valid?(num) # checking the range inclusion
      return @store[num]
    else
      raise "out of bounds"
    end
  end

  private

  def is_valid?(num)
    validate!(num)
  end

  def validate!(num)
    (0..@store.length-1).include?(num)

  end
end

a = MaxIntSet.new(3)

a.insert(0)
a.insert(1)
a.insert(2)
# a.insert(5)


a.remove(1)
# a.remove(4)

# puts a.store 

p a.include?(2)
# a.include?(7)


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
