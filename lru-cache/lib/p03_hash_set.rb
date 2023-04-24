class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def include?(item)
    self[item].include?(item)  
  end

  def insert(item)
    if !include?(item)
      self[item] << item
      @count += 1
    end
    resize! if @count == num_buckets
  end

  def remove(item)
    if include?(item)
      self[item].delete(item)
      @count -= 1
    end
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    items = @store.flatten
    @store = Array.new(num_buckets * 2)  { Array.new }
    items.each do |item|
      self[item] << item
    end
  end

  def [](item)
    bucket = item.hash % num_buckets
    @store[bucket]
  end
end