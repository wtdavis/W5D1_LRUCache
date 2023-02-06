class MaxIntSet

  attr_reader :store

  def initialize(max)
    @store = Array.new(max)
  end

  def insert(num)
    if is_valid?(num)
      @store[num] = true
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    if is_valid?(num)
      @store[num] = false
    else
      raise "Out of bounds"
    end
  end

  def include?(num)
    if is_valid?(num) # checking the range inclusion
      return @store[num]
    else
      raise "Out of bounds"
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

#test cases

# a.insert(0)
# a.insert(1)
# a.insert(2)
# # a.insert(5)


# a.remove(1)
# # a.remove(4)

# # puts a.store 

# p a.include?(2)
# a.include?(7)


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end


  def remove(num)
    if include?(num)
      self[num].delete(num)
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

a = IntSet.new

a.insert(20)
a.insert(5)
a.insert(10)
a.remove(5)
p a
a.remove(20)
p a
a.insert(-10)
p a
class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if self.include?(num)
      return
    else
      @count += 1
      if @count > self.num_buckets
        self.resize!
      end

      self[num] << num 
    end
   
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    tmp = []

    @store.each do |bucket|
      tmp += bucket
    end

    @store = Array.new( num_buckets * 2 ) { Array.new }
    
    tmp.each do |ele|
      self.insert(ele)
      @count -= 1
    end
  end

end
