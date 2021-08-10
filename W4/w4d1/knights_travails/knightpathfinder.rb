require_relative 'polytreenode.rb'

class KnightPathFinder

  attr_accessor :root_node

  def self.valid_moves(pos)
    x, y = pos
    possible_moves = [
      [x+2, y+1], 
      [x+2, y-1], 
      [x-2, y+1], 
      [x-2, y-1], 
      [x+1, y+2], 
      [x+1, y-2], 
      [x-1, y+2], 
      [x-1, y-2]
    ]


    legal_moves = possible_moves.select do |pos|
      x, y = pos
      x.between?(0, 7) && y.between?(0, 7)
    end
    return legal_moves
  end

  def initialize(start_pos)
    @start_pos = start_pos
    @considered_positions = [@start_pos]
    build_move_tree
  end

  def new_move_positions(start_pos)
    legal_moves = KnightPathFinder.valid_moves(start_pos)
    result = []
    legal_moves.each do |move|
      if !@considered_positions.include?(move)
        @considered_positions << move
        result << move
      end
    end
    result
  end

  def build_move_tree
    self.root_node = PolyTreeNode.new(@start_pos)
    nodes = [root_node]
    while !nodes.empty?
      current = nodes.shift
      current_pos = current.value
      moves = new_move_positions(current_pos)
      moves.each do |move|
        next_move = PolyTreeNode.new(move)
        current.add_child(next_move)
        nodes << next_move
      end
    end
  end

  def find_path(end_pos)
    end_node = self.root_node.dfs(end_pos)
    trace_path_back(end_node)
  end

  def trace_path_back(end_node)
    past_moves = []
    current_node = end_node
    until current_node.nil?
      past_moves << current_node.value
      current_node = current_node.parent
    end
    past_moves.reverse
  end

end

a = KnightPathFinder.new([0,0])
p a.find_path([7,6])
p a.find_path([6,2])