require '00_tree_node.rb'

class KnightPathFinder
  attr_reader
  
  def initialize(start_pos)
    @start_pos = start_pos 
    @visited_position = [@start_pos]
  end 
  
  def new_move_positions(start_pos)
      KnightPathFinder.valid_moves(start_pos).reject { |pos| @visited_position.include?(pos) }
  end 
  
  def find_path(end_pos)
    
  end 
  
  def build_move_tree
    node = PolyTreeNode.new([@start_pos])
    node.children = self.new_move_positions(@start_pos)
    
  end 
  
  def self.valid_moves(start_pos)
    
  end 
  
  MOVES = [[1,2]]
end 

