class Board 
  attr_accessor :colored, :keys, :row, :all_rows
  def initialize
    @colored = Array.new(4, nil)
    @keys = Array.new(4, nil)
    @row = [@colored, @keys]
    @all_rows = Array.new(12, @row)
  end

  def show
    puts "\n\n---Board---\n"
    @all_rows.reverse.each { |el| puts "#{el[0]} feedback: #{el[1]}" }
    puts "\n"
  end

end
