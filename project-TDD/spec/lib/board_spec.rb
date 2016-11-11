require 'board'

describe Board do
  before(:context) do
    @board = Board.new(7,6)
  end
  it 'creates a new board of size 7x6' do
    @board.grid[6][5] = 'lol'
    expect(@board.grid[6][5]).to eq('lol')
  end

  describe '#insert'
  it 'inserts a blue disk in the board' do
    player = Player.new("Sashe", :blue)
    @board.insert(1, player.color)
    expect(@board.grid[0][0]).to eq('◉'.colorize(:blue))
  end

  it 'inserts a red disk in the board' do
    player = Player.new("Sashe", :red)
    @board.insert(1, player.color)
    expect(@board.grid[0][1]).to eq('◉'.colorize(:red))
  end
end
