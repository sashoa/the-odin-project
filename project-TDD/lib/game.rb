require_relative 'player'
require_relative 'board'

class Game
  attr_reader :board
  def initialize(player_one, player_two, board)
    @player_one = player_one
    @player_two = player_two
    @board = board
  end

  def render
    i = (@board.size.split('x').first.to_i) - 1
    j = 0
    a = []
    while j < (@board.size.split('x')[1].to_i)
      (i + 1).times do
        a.unshift(" #{@board.grid[i][j]}")
        i -= 1
      end
      a.unshift(" |\n|")
      j += 1
      i = (@board.size.split('x').first.to_i) - 1
    end
    a.unshift("\n|--------------")
    a << " |\n|- - - - - - - -"
    a << "|\n| 1 2 3 4 5 6 7 |"
    a.join
  end

  def check_up_down(position)
    board = @board.grid
    i = 1

    column, row = position
    unless board[column][row +1].nil?
      while board[column][row +1] == board[column][row]
        i += 1
        row += 1
      end
    end

    column, row = position
    unless board[column][row -1].nil?
      while board[column][row -1] == board[column][row]
        i += 1
        row -= 1
      end
    end

    i >= 4 ? true : false
  end
  
end
player_one = Player.new('Sashe', :blue)
player_two = Player.new('Somebody', :red)
board = Board.new(7,6)
game = Game .new(player_one, player_two, board)

# game.board.insert(1, :blue)
# game.board.insert(2, :red)
# game.board.insert(2, :blue)
# game.board.insert(3, :red)
# game.board.insert(3, :blue)
# game.board.insert(3, :red)
# game.board.insert(2, :blue)
# game.board.insert(5, :red)
# game.board.insert(2, :blue)
# game.board.insert(2, :blue)
puts game.render

# p game.check_up_down(game.board.last_insert)

