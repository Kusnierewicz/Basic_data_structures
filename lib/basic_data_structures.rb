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

	def breadth_first_search(target, node, queue = [], checked = [])
	  if queue.empty? && checked.empty? == false
	    return nil
	  else
	  	if node.rootnode == true
	  	  if node.value == target
	  	    puts "!!!!!!!!!!!!!!!!!!!!wow #{queue.last.value} to szukana wartosc!"
	        result = node
	        return result
	      else
	        checked << node.id	        
			if node.leftchild != nil && checked.include?(node.leftchild) == false
			  position = select_node(node.leftchild)
			  if position.value == target
	            result = position
	            return result
			  else
			  	checked << position.id
	            queue.push(position.id)
	          end
	        end

		  	if node.rightchild != nil && checked.include?(node.rightchild) == false
		  	  position = select_node(node.rightchild)
			  if position.value == target
	  	        puts "!!!!!!!!!!!!!!!!!!!!wow #{position.value} to szukana wartosc!"
	  	        result = position
	            return result
			  else
			  	checked << position.id
	            queue.push(position.id)
	          end
	        end
	        breadth_first_search(target, select_node(queue[0]), queue, checked)
		  	#queue.delete(queue[0])
		  end
	    else        
		  if node.leftchild != nil && checked.include?(node.leftchild) == false
		    position = select_node(node.leftchild)
		    if position.value == target
  	          puts "!!!!!!!!!!!!!!!!!!!!wow #{position.value} to szukana wartosc!"
              result = position
              return result
		    else
		      checked << position.id
              queue.push(position.id)
            end
          end

	  	  if node.rightchild != nil && checked.include?(node.rightchild) == false
	  	    position = select_node(node.rightchild)
		    if position.value == target
  	          puts "!!!!!!!!!!!!!!!!!!!!wow #{position.value} to szukana wartosc!"
  	          result = position
              return result
		    else
		  	  checked << position.id
              queue.push(position.id)
            end
          end
	  	  queue.delete(queue[0])
	  	  breadth_first_search(target, select_node(queue[0]), queue, checked)
	    end
	  end

	end

	def depth_first_search(target, node, stack = [], checked = [])
	    if stack.empty? && checked.empty? == false

	      return result
	    else
	      if checked.include?(node)
			if stack.last.leftchild != nil && checked.include?(stack.last.leftchild) == false
		  	  depth_first_search(target, select_node(stack.last.leftchild), stack, checked)

		  	elsif stack.last.rightchild != nil && checked.include?(stack.last.rightchild) == false
		  	  depth_first_search(target, select_node(stack.last.rightchild), stack, checked)

		  	elsif stack.last.leftchild == nil && checked.include?(stack.last.rightchild)
		  	  stack.size > 1 ? stack.delete(stack[-1]) : (return result)
		  	  depth_first_search(target, select_node(stack.last.id), stack, checked)

		  	elsif checked.include?(stack.last.leftchild) && stack.last.rightchild == nil
		  	  stack.size > 1 ? stack.delete(stack[-1]) : (return result)
		  	  depth_first_search(target, select_node(stack.last.id), stack, checked)

		  	elsif stack.last.leftchild == nil && stack.last.rightchild == nil
		  	  stack.size > 1 ? stack.delete(stack[-1]) : (return result)
		  	  depth_first_search(target, select_node(stack.last.id), stack, checked)

		  	elsif checked.include?(stack.last.leftchild) && checked.include?(stack.last.rightchild)
		  	  stack.size > 1 ? stack.delete(stack[-1]) : (return result)
		  	  depth_first_search(target, select_node(stack.last.id), stack, checked)

		  	end

	      else
	      	stack << node
	      	checked << stack.last.id
			if stack.last.value == target
			  puts "!!!!!!!!!!!!!!!!!!!!wow #{stack.last.value} to szukana wartosc!"
			  result = stack.last

			elsif stack.last.leftchild != nil && checked.include?(stack.last.leftchild) == false
		  	  depth_first_search(target, select_node(stack.last.leftchild), stack, checked)

		  	elsif stack.last.rightchild != nil && checked.include?(stack.last.rightchild) == false
		  	  depth_first_search(target, select_node(stack.last.rightchild), stack, checked)

		  	elsif stack.last.leftchild == nil && checked.include?(stack.last.rightchild)
		  	  puts "#{stack.inspect}"
		  	  puts "#{stack.size}"
		  	  puts "#{stack.last.id}"
		  	  stack.size > 1 ? stack.delete(stack[-1]) : (return result)
		  	  depth_first_search(target, select_node(stack.last.id), stack, checked)

		  	elsif checked.include?(stack.last.leftchild) && stack.last.rightchild == nil
		  	  stack.size > 1 ? stack.delete(stack[-1]) : (return result)
		  	  depth_first_search(target, select_node(stack.last.id), stack, checked)

		  	elsif stack.last.leftchild == nil && stack.last.rightchild == nil
		  	  stack.size > 1 ? stack.delete(stack[-1]) : (return result)
		  	  depth_first_search(target, select_node(stack.last.id), stack, checked)

		  	elsif checked.include?(stack.last.leftchild) && checked.include?(stack.last.rightchild)
		  	  stack.size > 1 ? stack.delete(stack[-1]) : (return result)
		  	  depth_first_search(target, select_node(stack.last.id), stack, checked)

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
#tree.build_tree([3, 2, 4, 1, 5, 6, 8, 4])
puts " "
print "----------------reading tree----------------------"
puts " "
puts " "
tree.read_tree
puts " "
print "----------------stop reading tree-----------------"
puts " "

#puts tree.breadth_first_search(6345, tree.rootnode)
puts tree.depth_first_search(100, tree.rootnode)
#puts tree.depth_first_search(6345, tree.rootnode)
#puts tree.depth_first_search(324, tree.rootnode)
#puts tree.depth_first_search(23, tree.rootnode)
#puts tree.depth_first_search(67, tree.rootnode)

