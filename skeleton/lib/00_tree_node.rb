require 'byebug'

class PolyTreeNode
  
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  
  def parent=(parent_node)
    if parent_node == nil
      if @parent == nil
        return @parent
      else
        @parent.children.delete(self)
        return @parent = parent_node
      end
    end
    
    if @parent == nil
      @parent = parent_node
      parent_node.children.include?(self) ? parent_node.children : parent_node.children << self
    else
      @parent.children.delete(self)
      @parent = parent_node
      parent_node.children << self
    end 
  end
  
  def add_child(child_node)
    # debugger
    @children.include?(child_node) ? @children : @children << child_node 
    child_node.parent = self
  end
  
  def remove_child(child_node)
    self.children.delete(child_node)
    child_node.parent = nil
  end
  
  # private
  attr_reader :value, :children, :parent
end