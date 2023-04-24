class MaxIntSet

  attr_reader :max, :store
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def include?(num)
    @store[num] == true
  end

  def insert(num) # 1 // max = 50
    raise "Out of bounds" if num > max || num < 0

    @store[num] = true
    true
  end
  
  def remove(num)
    @store[num] = false
  end
  

  private

  def is_valid?(num)
    
  end

  def validate!(num)
  end
end

class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def include?(num)
    self[num].include?(num)  
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  private

  def [](num)
    bucket = num % num_buckets
    @store[bucket]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def include?(num)
    self[num].include?(num)  
  end

  def insert(num)
    if !include?(num)
      self[num] << num
      @count += 1
    end
    resize! if @count == num_buckets
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    nums = @store.flatten
    @store = Array.new(num_buckets * 2)  { Array.new }
    nums.each do |num|
      self[num] << num
    end
  end

  def [](num)
    bucket = num % num_buckets
    @store[bucket]
  end
end