class Board
  attr_accessor :grid
  def initialize
    @grid = generate_grid
  end

  def generate_grid
    a = []
    8.times { a << Array.new(8) }
    a
  end
end

class NodeField
  attr_reader :position
  attr_accessor :childs, :parent
  def initialize(position, childs = [], parent = nil)
    @position = position
    @parent = parent
    @childs = childs
  end
end

class Knight
  attr_reader :tree, :visited, :position
  def initialize(x = 0,y = 0)
    @position = [x,y]
    @posible_moves = [[2,1],[1,2],[-1,2],[-2,1],[-2,-1],[-1,-2],[1,-2],[2,-1]]
    @tree = NodeField.new(@position)
    @visited = [@tree]
  end

  def knight_move(start_move, end_move)
    new_tree(start_move)
    @position = start_move
    tree = build_tree(@tree)
    node = find_node_position(tree, end_move)
    find_path(node)
  end


  private

  def new_tree(start_move)
    @tree = NodeField.new(start_move)
  end

  def build_tree(parent_node, queue = [])
    parent_node.childs = gen_childs(parent_node)
    queue += parent_node.childs
    return if queue.empty?
    @visited += parent_node.childs
    build_tree(queue.shift, queue)
    parent_node
  end

  def find_path(node, a = [node.position])
    a << node.parent.position unless node.parent.nil?
    return if node.parent.nil?
    find_path(node.parent, a)
    a.reverse
  end

  def find_node_position(tree, position, queue = [])
    return tree if tree.position == position
    tree.childs.each do |child|
      queue << child
      return child if child.position == position
    end
    find_node_position(queue.shift, position, queue)
  end

  def gen_childs(parent_node, child_arr = [])
    posible_moves = @posible_moves
    position = parent_node.position
    posible_moves.each do |move|
      new_position = [position[0] + move[0], position[1] + move[1]]
      if off_the_board?(new_position)
        next
      else
        # p new_position
        child_arr << NodeField.new(new_position, [], parent_node) unless @visited.any? { |el| el.position == new_position}
      end
    end
    # p @visited
    # puts @visited.length
    child_arr
  end 

  def off_the_board?(p)
    less_than_zero?(p) || more_than_seven?(p) ? true : false
  end

  def less_than_zero?(p)
    p[0] < 0 || p[1] < 0 ? true : false
  end

  def more_than_seven?(p)
    p[0] > 7 || p[1] > 7 ? true : false
  end


end

dark_knight = Knight.new
p dark_knight.knight_move([0,0],[4,3])
