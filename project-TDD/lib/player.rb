class Player
  attr_reader :name, :color
  def initialize(name, color)
    @name = name.to_sym
    @color = color
  end

  def insert(board, position)
    board.insert(position, @color)
  end
end
