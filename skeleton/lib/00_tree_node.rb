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
      parent_node.children << self
    else
      @parent.children.delete(self)
      @parent = parent_node
      parent_node.children << self
    end 
  end
  
  
  # private
  attr_reader :value, :children, :parent
end