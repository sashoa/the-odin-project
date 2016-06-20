require_relative 'Mastermind'

print "Player name: "
name = gets.chomp
game = Mastermind.new(name)
game.start
