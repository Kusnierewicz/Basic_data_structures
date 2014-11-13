def build_tree(arr)
  #Write a method build_tree which takes an array of data 
  #(e.g. [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) 
  #and turns it into a binary tree full of Node objects 
  #appropriately placed. Start by assuming the array you 
  #get is sorted.

end

def build_tree_2(arr)
  #Now refactor your build_tree to handle data that isn't 
  #presorted and cannot be easily sorted prior to building 
  #the tree. You'll need to figure out how to add a node for 
  #each of the possible cases (e.g. if it's a leaf versus in 
  #the middle somewhere).

end

def breadth_first_search(target)
  #Build a method breadth_first_search which takes a target 
  #value and returns the node at which it is located using 
  #the breadth first search technique. Tip: You will want to 
  #use an array acting as a queue to keep track of all the 
  #child nodes that you have yet to search and to add new ones 
  #to the list (as you saw in the video). If the target node 
  #value is not located, return nil.

end

def depth_first_search(target)
  #Build a method depth_first_search which returns the node 
  #at which the target value is located using the depth first 
  #search technique. Use an array acting as a stack to do this.

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