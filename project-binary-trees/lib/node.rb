class Node
  attr_accessor :parent, :child
  attr_reader :value
  def initialize(value, parent = nil, left = nil, right = nil)
    @value = value
    @parent = parent
    @child = {left: left, right: right}
  end

end
