
module BasicDataStructures
  class Node
  	#Build a class Node. It should have a value that 
  	#it stores and also links to its parent and 
  	#children (if they exist). Build getters and 
  	#setters for it (e.g. parent node, child node(s)).
  	attr_accessor :value, :leftchild, :rightchild, :rootnode, :parrent

  	def initialize(value)
  	  @value = value
  	  @leftchild = nil
  	  @rightchild = nil
  	  @rootnode = nil
  	  @parrent = nil
  	end

  end
end