require 'tic_tac_toe.rb'

describe TicTacToe do
  before(:all) do
    @game = TicTacToe.new('p1', 'p2')
  end
  describe '#combinations' do
    it 'returns winning symbol if player won' do
      @game.board.arr[0] = 'X'
      @game.board.arr[1] = 'X'
      @game.board.arr[2] = 'X'
      expect(@game.combinations(@game.board.arr)).to eq('X')
    end
  end

  describe '#move' do
    it 'player places symbol on the board' do
      @game.move(@game.player_x, 9)
      expect(@game.board.arr[8]).to eq('X')
    end
  end

  describe '#game_over?' do
    it 'returns true if game is over' do
      expect(@game.game_over?).to be(true)
    end

    it 'returns false if game in not over' do
      @game.board.arr[0] = 'O'
      @game.board.arr[3] = 'X'
      expect(@game.game_over?).to be(false)
    end

    it 'returns true if nobody wins and game is over' do
      @game.board.arr = ['X','O','X','O','X','O','O','X','O']
      expect(@game.game_over?).to be(true)
    end
  end

  describe '#combinations' do
    it "returns the symbol for winning combination - 'X'" do
      @game.board.arr[1] = 'X'
      expect(@game.combinations(@game.board.arr)).to eq('X')
    end

    it "returns the symbol for winning combination - 'O'" do
      @game.board.arr[0] = 'O'
      @game.board.arr[1] = 'O'
      @game.board.arr[2] = 'O'
      expect(@game.combinations(@game.board.arr)).to eq('O')
    end
  end
end

describe TicTacToe::Player do
  context '#initialize' do
    it "initializes with player name 'Sashe' and symbol 'X'" do
      player = TicTacToe::Player.new('Sashe', 'X')
      expect(player.name).to eq('Sashe')
    end
  end
end

describe TicTacToe::Board do
  context '#initialize' do
    it "initializes with board array with 9 fields" do
      board = TicTacToe::Board.new
      expect(board.arr.length).to eq(9)
    end
  end
end
