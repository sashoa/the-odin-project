require './searching-binary-trees.rb'

tree = build_tree([9,1,7,4,2,3,8,9,4,3,67,636,342,15])

def depth_first_search(value, stack)
  visited = []
  return stack.pop if value == stack[-1].value && stack[-1].parent.nil?
  while !stack.empty?
    left = stack[-1].child[:left]
    right = stack[-1].child[:right]

# Check if left and right children are visited or nil
    if ((left.nil? || left.value.nil?) || visited.include?(left)) && ((right.nil? || right.value.nil?) || visited.include?(right)) 
      stack.pop
    else
      a = [left, right].select { |el| (!el.nil? && !el.value.nil?) && !visited.include?(el)}
      visited << a.first
      return a.first if a.first.value == value
      stack << a.first
    end
  end
end

def dfs_rec(value, tree, a = -1)
  return tree if tree.value == value
  tree.child.each_value do |val|
    next if val.nil?
    a = dfs_rec(value, val, a)
  end
  a
end



puts breadth_first_search(4,[tree]).value
puts depth_first_search(636,[tree]).value
puts dfs_rec(342, tree).value
