require 'byebug'

class PolyTreeNode
  attr_accessor :children, :value 
  attr_reader :parent
  
  def initialize(value)
    @parent = nil 
    @children = []
    @value = value
  end 
  
  def parent=(node)
    
    # if node == nil
    #   # @parent    
      
    if self.parent 
     self.parent.children.delete(self)    
    end 
    @parent = node
    node.children << self unless node.nil? || node.children.include?(self) 
  end
  
  def add_child(child_node)
    child_node.parent = self
  end
  
  def remove_child(child_node)
    if self.children.include?(child_node)
      child_node.parent = nil
      self.children.delete(child_node) 
    else
      raise Error
    end
  end
  
  def dfs(target_value)
    return self if self.value == target_value 
    # return nil if self.children.e
      self.children.each do |child| 
        check = child.dfs(target_value)
        return check unless check.nil?
      end 
        nil
  end 
   
  def bfs(target_value)
    # return self if self.value == target_value 
    queue = [self]
    until queue.empty? 
      node = queue.shift 
      return node if node.value == target_value 
      queue += node.children 
    end
    nil
    
  end  # end
  
end

n1 = PolyTreeNode.new("root1")
n2 = PolyTreeNode.new("root2")
n3 = PolyTreeNode.new("root3")

# connect n3 to n1
n3.parent = n1
# connect n3 to n2
n3.parent = n2