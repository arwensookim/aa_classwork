class PolyTreeNode

  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    if node == nil
      @parent = node 
      return self
    end
    if !@parent.nil? && @parent != node
      @parent.children.delete(self)
    end
    @parent = node
    if !node.children.include?(self)
      node.children << self
    end
  end

  def add_child(child_node)
    if !self.children.include?(child_node)
      @children << child_node
      child_node.parent = self
    end
  end

  def remove_child(child_node)
    if self.children.include?(child_node)
      self.children.delete(child_node)
    else
      raise 'not a child'
    end
    child_node.parent = nil
  end
  
  def dfs(target_value)
    return self if self.value == target_value
    return nil if self.children.empty?

    self.children.each do |child|
      child_dfs = child.dfs(target_value)
      if !child_dfs.nil?
        return child
      end
    end
    return nil
  end

end






# [[a],[b,c], [d,e,f]]

# @parent.children.delete(self)

#    j   a
#   /  \
#   b       c   self. b parent = j
#  /\     /  \        j children = b               a children
# d   e  f    g

# p a = PolyTreeNode.new('a')
# p b = PolyTreeNode.new('b')
# p d = PolyTreeNode.new('d')

# b.parent = 'a'

# p b