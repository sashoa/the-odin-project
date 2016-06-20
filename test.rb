
class Pegs
  attr_reader :code_pegs, :key_pegs
  def initialize
    @code_pegs = ["red", "green", "blue", "purple", "yellow", "cyan"]
    @key_pegs = ["black", "white"]
  end
end

pegs = Pegs.new
puts pegs.code_pegs
