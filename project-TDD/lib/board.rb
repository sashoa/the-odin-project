require 'colorize'
# Board. Responsible for building the grid. Can recive a disk for a position.
class Board
  attr_accessor :grid, :size, :last_insert
  def initialize(x,y)
    @grid = Array.new(7) { Array.new(y, '○')}
    @size = "#{x}x#{y}"
    @last_insert = nil                                # Keep track of the last insert
  end

  def insert(position, color)
    position -= 1
    pos = @grid[position].find_index { |el| el == '○'}
    @grid[position][pos] = '◉'.colorize(color)
    @last_insert = [position, pos]
  end
end
