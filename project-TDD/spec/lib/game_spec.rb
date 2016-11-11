require 'game'
describe Game do
  before(:context) do
    @player_one = Player.new('Sashe', :blue)
    @player_two = Player.new('Somebody', :red)
    @board = Board.new(7,6)
    @game = Game.new(@player_one, @player_two, @board)
  end

  
  describe '#render_board' do
    it 'drows a nice board on the command line' do
    end
  end
end
