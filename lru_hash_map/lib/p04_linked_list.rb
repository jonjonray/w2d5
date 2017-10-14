class Node
  attr_accessor :key, :val, :next, :prev

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
    @prev.next = @next
    @next.prev = @prev
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

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)

    next_node = first

    until next_node == @tail
      return next_node.val if next_node.key == key
      next_node = next_node.next
    end

  end

  def include?(key)
    !get(key).nil?
  end

  def append(key, val)
    node = Node.new(key,val)
    node.prev = last
    last.next = node
    @tail.prev = node
    node.next = @tail
  end

  def update(key, val)

    next_node = first

    until next_node == @tail
      next_node.val = val if next_node.key == key
      next_node = next_node.next
    end
    nil
  end

  def remove(key)

    next_node = first

    until next_node == @tail
      next_node.remove if next_node.key == key
      next_node = next_node.next
    end
  end

  def each

    next_node = first

    until next_node == @tail
      yield next_node
      next_node = next_node.next
    end
  end



  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end

end
