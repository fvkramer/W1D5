class PolyTreeNode
  
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  
  
  
  private
  attr_accessor :value, :children, :parent
end