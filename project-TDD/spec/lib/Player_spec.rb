require 'player.rb'

describe Player do

  before(:context) do
    @person = Player.new('Sashe', :blue)
    @board = Board.new(7,6)
  end

  it "creates a player with a name 'Sashe'" do
    expect(@person.name).to eq(:Sashe)
  end

  it "creates a player with :blue color of choice for the disk" do
    expect(@person.color).to eq(:blue)
  end

  describe '#insert'do
    it 'inserts a blue disk in the board' do
      @person.insert(@board, 2)
      expect(@board.grid[1][0]).to eq('◉'.colorize(:blue))
    end

    it 'inserts a red disk in the board' do
      player = Player.new('Sashe', :red)
      player.insert(@board, 2)
      expect(@board.grid[1][1]).to eq('◉'.colorize(:red))
    end
  end

end
