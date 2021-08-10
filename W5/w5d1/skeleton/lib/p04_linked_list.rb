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
    # From:  |---------------->
    # [node_1] <- [node_2] -> [node_3]
    # To: 
    # [node_1] <-> [node_3]
    # [node_2] <->

    self.prev.next = self.next
    self.next.prev = self.prev
  end
end

class LinkedList
include Enumerable
attr_reader :head, :tail
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
    self.head.next
  end

  def last
    self.tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key
    end
  end

  def include?(key)
    self.any?{|node| node.key == key}
  end

  def append(key, val)
    new_node = Node.new(key, val)
    new_node.next = @tail
    new_node.prev = last
    last.next = new_node
    @tail.prev = new_node
  end

  def update(key, val)
    self.each do |node|
      node.val = val if node.key == key
    end
  end

  def remove(key)
    self.each do |node|
      node.remove if node.key == key
    end
  end

  def each(&prc)
    current = @head.next
    while current != @tail
      prc.call(current)
      current = current.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end


if __FILE__ == $PROGRAM_NAME

  list = LinkedList.new
  p list.empty?

  p list.include?("key")
end