arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
arr2 = []


arr.each_with_index do |no, index|
  arr2 << instance_variable_set("@node#{index}", no)


    # this will define @market0_id = 448  
  
end

puts arr2.inspect

