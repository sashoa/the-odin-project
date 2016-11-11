class TicTacToe
  attr_accessor :board, :player_x, :player_o

  def initialize(player1, player2)
    @board = Board.new

    @player_x = Player.new(player1, "X")
    @player_o = Player.new(player2, "O")
  end

  # Move method which places X or O on the board
  def move(player, number)
    field = @board.arr[number - 1]
    if field == nil
      @board.arr[number - 1] = player.symbol
    else
      puts "\nThat field is already written, Input number of an empty field:\n"
      number = gets.chomp.to_i
      move(player, number)
    end
  end

  def game_over?
    a = combinations(@board.arr)
    if a != nil
      puts "\n#{@board.show}"
      puts "#{a} wins"
      return true
    else
      if @board.arr.none? { |el| el == nil }
        puts "\nNobody wins"
        return true
      else return false
      end
    end
  end

  def combinations(arr)
    a = arr
    if a[0] != nil && a[0] == a[1] && a[0] == a[2]
      return a[0]
    elsif a[3] != nil && a[3] == a[4] && a[3] == a[5]
      return a[3]
    elsif a[6] != nil && a[6] == a[7] && a[6] == a[8]
      return a[6]
    elsif a[0] != nil && a[0] == a[3] && a[0] == a[6]
      return a[0]
    elsif a[1] != nil && a[1] == a[4] && a[1] == a[7]
      return a[1]
    elsif a[2] != nil && a[2] == a[5] && a[2] == a[8]
      return a[2]
    elsif a[0] != nil && a[0] == a[4] && a[0] == a[8]
      return a[0]
    elsif a[2] != nil && a[2] == a[4] && a[2] == a[6]
    else return nil
    end
  end

  def start
    turn = @player_x
    while !game_over? do
      @board.show
      puts "\n#{turn.name}'s turn. Input field number:"
      num = gets.chomp.to_i
      move(turn, num)
      if turn == @player_x
        turn = @player_o
      else
        turn = @player_x
      end
    end
  end


  class Player
    attr_reader :name, :symbol

    def initialize(name, symbol)
      @name = name
      @symbol = symbol
    end
  end

  # Class representing the X / O Board
  class Board
    attr_accessor :arr

    def initialize
      @arr = Array.new(9, nil)
    end

    def show
      puts "\n #{@arr[0] || ' '} | #{@arr[1] || ' '} | #{@arr[2] || ' '}"
      puts '-----------'
      puts " #{@arr[3] || ' '} | #{@arr[4] || ' '} | #{@arr[5] || ' '}"
      puts '-----------'
      puts " #{@arr[6] || ' '} | #{@arr[7] || ' '} | #{@arr[8] || ' '}\n\n"
    end
  end
end

# puts 'Input name for first player (X)'
# first = gets.chomp
# puts 'Input name for second player (O)'
# second = gets.chomp

# game = TicTacToe.new(first, second)
# game.start
