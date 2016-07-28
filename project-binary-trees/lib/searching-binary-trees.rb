require './node.rb'
require './helper/build-tree-helper.rb'

def build_tree(arr)
  root = Node.new(arr[0]) unless arr.empty?
  branch = root
  arr.each_with_index do |el,index|
    next if index.zero?
    add_node(el, branch)
  end
  root
end

def breadth_first_search(value, queue)
  return 'nil' if queue.empty?
  queue.pop.child.each do |key,val|
    next if val.nil?
    return val if value == val.value
    queue.unshift(val)
  end
  breadth_first_search(value, queue)
end

