
module BasicDataStructures
  class Node
  	#Build a class Node. It should have a value that 
  	#it stores and also links to its parent and 
  	#children (if they exist). Build getters and 
  	#setters for it (e.g. parent node, child node(s)).
  	attr_accessor :value, :leftchild, :rightchild, :rootnode, :parent

  	def initialize(value)
  	  @value = value
  	  @leftchild = nil
  	  @rightchild = nil
  	  @rootnode = nil
  	  @parent = nil
  	end

  	def set_parent(parent)
	  self.parent = parent.value
	  #set higher node as parent
	end

	def set_child(child)
      self.value > child.value ? self.leftchild = child.value : self.rightchild = child.value
	end

	def set_root
	  self.rootnode = true
	  #set higher node as parent
	end

  end
end