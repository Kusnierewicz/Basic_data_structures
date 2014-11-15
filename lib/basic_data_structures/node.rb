
module BasicDataStructures
  class Node
  	#Build a class Node. It should have a value that 
  	#it stores and also links to its parent and 
  	#children (if they exist). Build getters and 
  	#setters for it (e.g. parent node, child node(s)).
  	attr_accessor :id, :value, :leftchild, :rightchild, :rootnode, :parent

  	def initialize(value)
  	  @id = nil
  	  @value = value
  	  @leftchild = nil
  	  @rightchild = nil
  	  @rootnode = nil
  	  @parent = nil
  	end

  	def set_parent(parent)
  	  #puts "parent value = #{parent.value}"
	  self.parent = parent.id
	  #set higher node as parent
	end

	def set_child(child)
	  #puts "self value = #{self.value}"
	  #puts "child value = #{child.value}"
      self.value > child.value ? self.leftchild = child.id : self.rightchild = child.id
      return
	end

	def set_root
	  self.rootnode = true
	  #set higher node as parent
	end

  end
end