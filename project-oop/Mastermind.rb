class Mastermind
  attr_reader :peg_set   #debug

  def initialize(name)
    @player = Player.new(name)
    @board = Board.new
    @peg_set = Pegs.new
    @code = generator
  end

  def ai
    switch_mode = @feedback_store.include?(nil) ? false : true
    current_fb = @feedback_store
    n_black = current_fb.count { |x| x = "black"} 
    n_white = current_fb.count { |x| x = "white"}
    n_nil = current_fb.count { |x| = "nil"}

    prev_n_black = previous_fb.count { |x| x = "black"}
    prev_n_white = previous_fb.count { |x| x = "white"}
    prev_n_nil = previous_fb.count { |x| x = "nil"}
    @previous_fb = current_fb

  end

  def start(ai?)
    if ai?
      i = 0
      @board.show
      print "Choose a code: "
      @code = guess
      @ai_guess = generator
      while i < 12 do
        @guessed = @ai_guess 
        @feedback_store = feedback
        @board.all_rows[i] = [@guessed, @feedback_store]
        @board.show      
        if @guessed == @code
          puts "WIN"
          return
        else 
          @guess_ai = ai
        end
        i += 1
      end

    else
      i = 0
      @board.show
      puts "\n Possible colors are: #{@peg_set.code_pegs.join(', ')}"
      while i < 12 do
        puts "\nInput your guess"
        @guessed = guess
        @feedback_store = feedback
        @board.all_rows[i] = [@guessed, @feedback_store]
        @board.show
        if @guessed == @code
          puts "WIN"
          return
        end
        i += 1
      end
    end
  end

  def generator
    code = []
    store_pegs = @peg_set.code_pegs.map { |e| e }
    4.times do
    code << store_pegs.delete_at(rand((store_pegs.length) -1))
    end
    # puts code #debug
    code
  end

  def guess
    input = gets.chomp.split(" ")
    until check_colors(input) && input.length == 4 do
      puts "Wrong colors and/or number of colors. Choose 4 from the following colors: #{@peg_set.code_pegs.join(' ')}"     
      input = gets.chomp.split(" ")
    end
    input
  end

  def feedback
    i = 0
    a = []
    while i < 4 do
      if @code[i] == @guessed[i]
        a << "black"
      elsif @code.include?(@guessed[i])
        a << "white"
      else a << "nil"
      end
      i += 1
    end
    a.sort { |x,y| y.length <=> x.length}
  end

  def check_colors(a)
    store_pegs = @peg_set.code_pegs
    return true if a.all? { |el| store_pegs.include?(el) }
    false
  end

  require_relative 'Player'
  require_relative 'Board'
  require_relative 'Pegs'

end
