
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end

end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def empty?
    # @head.next == @tail
  end
  
  def append(key, val)
    new_node = Node.new(key, val) # creates a new node to append
    new_node.next = @tail # sets new nodes next to tail
    new_node.prev = @tail.prev
    @tail.prev = new_node 
    new_node.prev.next = new_node
  end
  
  def each

  end
  
  def update(key, val)

  end
  
  def get(key)

  end
  
  def remove(key)
  end
  
  def include?(key)
  end
  
  def first
    @head.next
  end
  
  def last
    @tail.prev
  end
  
  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end
  






  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end