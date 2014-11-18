require_relative "basic_data_structures/version.rb"
require_relative "basic_data_structures/node.rb"

module BasicDataStructures

  class Tree

  	def initialize(name)
  	  @name = name
  	end

  	def build_tree(arr)
  	  @branch = []

  	  arr.each_with_index do |element, index|
  	  	if @branch.empty? 
  	  	  @noderoot = BasicDataStructures::Node.new(element)
  	  	  @noderoot.set_root
  	  	  @noderoot.id = @noderoot.object_id
  	  	  @branch << @noderoot
  	  	else
  	  	  @branch << instance_variable_set("@node#{index}", BasicDataStructures::Node.new(element))
  	  	  @branch.last.id = @branch.last.object_id
  	  	  add_to_tree(@branch.last, @noderoot)
  	  	end
  	  end
	end

	def add_to_tree(new_node, parent_node)
	  if new_node.value >= parent_node.value
  	  	if parent_node.rightchild == nil
  	  	  parent_node.set_child(new_node)
  	  	  new_node.set_parent(parent_node)
  	  	else
  	  	  add_to_tree(new_node, select_node(parent_node.rightchild))
  	  	end
  	  elsif new_node.value < parent_node.value
  	  	if parent_node.leftchild == nil
  	  	  parent_node.set_child(new_node)
  	  	  new_node.set_parent(parent_node)
  	  	else
  	  	  add_to_tree(new_node, select_node(parent_node.leftchild))
  	  	end
  	  end
	end

	def select_node(n_value)
	  @branch.each_with_index do |element, index|
	  	if element.id == n_value
	  	  return element
	  	end
	  end
	end

	def breadth_first_search(target)
	  queue = [] #add to the "back" and remove from the "front"!
	  #Build a method breadth_first_search which takes a target 
	  #value and returns the node at which it is located using 
	  #the breadth first search technique. Tip: You will want to 
	  #use an array acting as a queue to keep track of all the 
	  #child nodes that you have yet to search and to add new ones 
	  #to the list (as you saw in the video). If the target node 
	  #value is not located, return nil.

	end

	def depth_first_search2(target, node, stack = [], checked = [])
		puts "#{node} - zaczynam kod"
	   #add to the top and remove from the top!
	    puts "IS STACK EMPTY #{stack.empty?}"
	    puts "STACK SIZE #{stack.size}"

	    if stack.empty? && checked.empty? == false
	      return result
	    else
	      if checked.include?(node)
	      	puts "#{node} juz byl sprawdzany"


			if stack.last.leftchild != nil && checked.include?(stack.last.leftchild) == false
				puts "jest lewe jadro i nie bylo sprawdzane"
		  	  depth_first_search2(target, select_node(stack.last.leftchild), stack, checked)

		  	elsif stack.last.rightchild != nil && checked.include?(stack.last.rightchild) == false
		  		puts "jest prawe jadro i nie bylo sprawdzane"
		  	  depth_first_search2(target, select_node(stack.last.rightchild), stack, checked)

		  	elsif stack.last.leftchild == nil && checked.include?(stack.last.rightchild)
		  		puts "lewe jadro nie istnieje a prawe bylo sprawdzane"
		  		puts "STACK SIZE #{stack.size}"
		  	  stack.delete(stack[-1])
		  	  	puts "IS STACK EMPTY #{stack.empty?}"
		  	  	puts "STACK SIZE #{stack.size}"
		  	  depth_first_search2(target, select_node(stack.last.id), stack, checked)

		  	elsif checked.include?(stack.last.leftchild) && stack.last.rightchild == nil
		  		puts "prawe jadro nie istnieje a lewe bylo sprawdzane"
		  		puts "STACK SIZE #{stack.size}"
		  	  stack.delete(stack[-1])
		  	  	puts "IS STACK EMPTY #{stack.empty?}"
		  	  	puts "STACK SIZE #{stack.size}"
		  	  depth_first_search2(target, select_node(stack.last.id), stack, checked)

		  	elsif stack.last.leftchild == nil && stack.last.rightchild == nil
		  		puts "na lewo i na prawo pusto"
		  		puts "STACK SIZE #{stack.size}"
		  	  stack.delete(stack[-1])
		  	  	puts "IS STACK EMPTY #{stack.empty?}"
		  	  	puts "STACK SIZE #{stack.size}"
		  	  depth_first_search2(target, select_node(stack.last.id), stack, checked)

		  	elsif checked.include?(stack.last.leftchild) && checked.include?(stack.last.rightchild)
		  		puts "dzieci sprawdzone po obu stronach"
		  		puts "STACK SIZE #{stack.size}"
		  	  stack.delete(stack[-1])
		  	    puts "IS STACK EMPTY #{stack.empty?}"
		  	    puts "STACK SIZE #{stack.size}"
		  	  depth_first_search2(target, select_node(stack.last.id), stack, checked)

		  	end

	      else
	      	puts "#{node} nie byl sprawdzany"
	      	stack << node
	      	puts "STACK = #{stack}"
	      	checked << stack.last.id
	      	puts "CHECKED = #{checked}"
			if stack.last.value == target
				puts "!!!!!!!!!!!!!!!!!!!!wow #{stack.last.value} to szukana wartosc!"
			  result = stack.last

			elsif stack.last.leftchild != nil && checked.include?(stack.last.leftchild) == false
		  	  puts "jest lewe jadro i nie bylo sprawdzane"
		  	  depth_first_search2(target, select_node(stack.last.leftchild), stack, checked)


		  	elsif stack.last.rightchild != nil && checked.include?(stack.last.rightchild) == false
		  		puts "jest prawe jadro i nie bylo sprawdzane"
		  	  depth_first_search2(target, select_node(stack.last.rightchild), stack, checked)

		  	elsif stack.last.leftchild == nil && checked.include?(stack.last.rightchild)
		  		puts "lewe jadro nie istnieje a prawe bylo sprawdzane"
		  		puts "STACK SIZE #{stack.size}"
		  	  stack.delete(stack[-1])
		  	  	puts "IS STACK EMPTY #{stack.empty?}"
		  	  	puts "STACK SIZE #{stack.size}"
		  	  depth_first_search2(target, select_node(stack.last.id), stack, checked)

		  	elsif checked.include?(stack.last.leftchild) && stack.last.rightchild == nil
		  		puts "prawe jadro nie istnieje a lewe bylo sprawdzane"
		  		puts "STACK SIZE #{stack.size}"
		  	  stack.delete(stack[-1])
		  	  	puts "IS STACK EMPTY #{stack.empty?}"
		  	  	puts "STACK SIZE #{stack.size}"
		  	  depth_first_search2(target, select_node(stack.last.id), stack, checked)

		  	elsif stack.last.leftchild == nil && stack.last.rightchild == nil
		  		puts "na lewo i na prawo pusto"
		  		puts "STACK SIZE #{stack.size}"
		  	  stack.delete(stack[-1])
		  	  puts "IS STACK EMPTY #{stack.empty?}"
		  	    puts "STACK SIZE #{stack.size}"
		  	  depth_first_search2(target, select_node(stack.last.id), stack, checked)

		  	elsif checked.include?(stack.last.leftchild) && checked.include?(stack.last.rightchild)
		  		puts "dzieci sprawdzone po obu stronach"
		  		puts "STACK SIZE #{stack.size}"
		  	  stack.delete(stack[-1])
		  	  puts "IS STACK EMPTY #{stack.empty?}"
		  	    puts "STACK SIZE #{stack.size}"
		  	  depth_first_search2(target, select_node(stack.last.id), stack, checked)

		  	end
		  end
		end
	end

	def dfs(target)
	  #Next, build a new method dfs_rec which runs a depth first 
	  #search as before but this time, instead of using a stack, 
	  #make this method recursive.
	  #
	  #Tips:
	  #You can think of the dfs_rec method as a little robot that 
	  #crawls down the tree, checking if a node is the correct 
	  #node and spawning other little robots to keep searching the 
	  #tree. No robot is allowed to turn on, though, until all the 
	  #robots to its left have finished their task.
	  #
	  #The method will need to take in both the target value and 
	  #the current node to compare against.

	end

	def rootnode
	  @branch[0]
	end

	def read_tree
	  @branch.each do |element|
	  	puts element.inspect
	  end
	end

  end

end


tree = BasicDataStructures::Tree.new("test")

#tree.build_tree([4,3,5,2,2,1,1,24,33,17,13])
tree.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
#tree.build_tree([3, 2, 4])
puts " "
print "----------------reading tree----------------------"
puts " "
puts " "
tree.read_tree
puts " "
print "----------------stop reading tree-----------------"
puts " "
puts tree.rootnode
puts tree.depth_first_search2(6345, tree.rootnode)

