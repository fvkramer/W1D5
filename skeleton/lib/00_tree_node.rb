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
      #check for child duplicity on parent node
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
    self.children.include?(child_node) ? self.children.delete(child_node) : raise_error
    child_node.parent = nil
  end
  
  def dfs(target_value)
    return self if self.value == target_value
    # return nil if self == []
    self.children.each do |child|
      search_res = child.dfs(target_value)
      return search_res unless search_res.nil?
    end
    nil
  end
  
  def bfs(target_value)
    new_array = []
    new_array << self
    
    until new_array.empty?
      el = new_array.shift
      return el if el.value == target_value
      el.children.each { |child| new_array << child }
    end
  end
  
  # private
  attr_reader :value, :children, :parent
end