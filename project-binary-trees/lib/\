def add_node(x, branch)
  input_left(x, branch) if x <= branch.value
  input_right(x, branch) if x >= branch.value
end

def input_left(x, branch)
  if branch.child[:left].nil?
    branch.child[:left] = Node.new(x,branch)
  else 
    add_node(x, branch.child[:left])
  end
end

def input_right(x, branch)
  if branch.child[:right].nil?
    branch.child[:right] = Node.new(x,branch)
  else 
    add_node(x, branch.child[:right])
  end
end
