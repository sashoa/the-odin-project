#---------Billion secconds since born---------------#

born = Time.mktime(1990, 10, 26, 01)
born = born + 1000000000

puts born.to_s + " is the bilionth second since birth"

#------SPANK!--------##

puts "What year were you born at"
year = gets.chomp.to_i

puts "Which day were you born at"
month = gets.chomp.to_i

puts "What month were you born at"
day = gets.chomp.to_i

birthday = Time.mktime(year, day, month)
now = Time.new
year += 1
while birthday < now
  year += 1
  birthday = Time.mktime(year, day, month)
  puts "Spank!"
end

#------Roling Dice---------##

class Die
  def initialize
    roll
  end

  def roll
    @num = -1
    @number_showing = 1 + rand(6)

  end

  def show
    if @num != -1
      return @num
    else
      return @number_showing
    end

  end

  def cheat (num_i)
    @num = num_i
    while @num > 6 && @num < 1
      @number_showing = @num
    end

  end
end

obj_die = Die.new
puts obj_die.show
obj_die.cheat(5)
puts obj_die.show
obj_die.roll
puts obj_die.show

#---------Orange Tree--------##
# OrangeTree class
# height method which returns height
# oneYearPasses method which ages the tree
# each year grows taller
# the tree dies after 15 years
# doesnt give fruit first 2 years
# how many oranges are there
# pickAnOrange reduces @orangeCount
# ramain oranges fall at the end of the year

class OrangeTree
  def initialize
    @years_age = 0
    puts "You planted an orange tree"
    @init_height = 50
    @oranges_left = 0
  end

  def age
    return @years_age.to_s + " Years age"
  end
  def height
    h = (@init_height + @years_age * 15 ) / 100.0
    h.to_s + " meters height"
  end

  def oneYearPasses
    increment = 0
    @years_age +=1
    if @years_age > 15
      puts "the tree is death"
      @oranges_left = 0
    else
      if @years_age < 3
        @oranges_left = 0
      else
        @oranges_left = ((@years_age - 2) + increment) * 5
        increment += 5
      end
      puts "One Year Passes. The tree is #{@years_age} years old"
    end

  end


  def numberOfOranges
    return @oranges_left.to_s + " Oranges left"

  end

  def pickAnOrange
    if @oranges_left > 0
      @oranges_left -= 1
    else
      puts "There are no oranges"
    end

  end
end

tree = OrangeTree.new
puts tree.height
puts tree.numberOfOranges
tree.pickAnOrange
puts ""
tree.oneYearPasses
puts tree.height
puts tree.numberOfOranges
tree.pickAnOrange
tree.oneYearPasses
puts tree.height
puts tree.numberOfOranges
tree.pickAnOrange
tree.oneYearPasses
puts tree.height
puts tree.numberOfOranges
tree.pickAnOrange
tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses
puts tree.height
puts tree.numberOfOranges
tree.pickAnOrange
tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses
puts tree.height
puts tree.numberOfOranges
tree.pickAnOrange
tree.oneYearPasses

puts tree.height
puts tree.numberOfOranges
tree.pickAnOrange
tree.oneYearPasses
puts tree.height
puts tree.numberOfOranges
tree.pickAnOrange

#------Baby Dragon------##

class Dragon

  def initialize name
    @name = name
    @asleep = false
    @stuffInBelly     = 10  # He's full.
    @stuffInIntestine =  0  # He doesn't need to go.

    puts @name + ' is born.'
  end

  def feed
    puts 'You feed ' + @name + '.'
    @stuffInBelly = 10
    passageOfTime
  end

  def walk
    puts 'You walk ' + @name + '.'
    @stuffInIntestine = 0
    passageOfTime
  end

  def putToBed
    puts 'You put ' + @name + ' to bed.'
    @asleep = true
    3.times do
      if @asleep
        passageOfTime
      end
      if @asleep
        puts @name + ' snores, filling the room with smoke.'
      end
    end
    if @asleep
      @asleep = false
      puts @name + ' wakes up slowly.'
    end
  end

  def toss
    puts 'You toss ' + @name + ' up into the air.'
    puts 'He giggles, which singes your eyebrows.'
    passageOfTime
  end

  def rock
    puts 'You rock ' + @name + ' gently.'
    @asleep = true
    puts 'He briefly dozes off...'
    passageOfTime
    if @asleep
      @asleep = false
      puts '...but wakes when you stop.'
    end
  end

  private

  # "private" means that the methods defined here are
  # methods internal to the object.  (You can feed
  # your dragon, but you can't ask him if he's hungry.)

  def hungry?
    # Method names can end with "?".
    # Usually, we only do this if the method
    # returns true or false, like this:
    @stuffInBelly <= 2
  end

  def poopy?
    @stuffInIntestine >= 8
  end

  def passageOfTime
    if @stuffInBelly > 0
      # Move food from belly to intestine.
      @stuffInBelly     = @stuffInBelly     - 1
      @stuffInIntestine = @stuffInIntestine + 1
    else  # Our dragon is starving!
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      @dragon_is_dead = true
      puts @name + ' is starving!  In desperation, he ate YOU!'
      exit  # This quits the program.
    end

    if @stuffInIntestine >= 10
      @stuffInIntestine = 0
      puts 'Whoops!  ' + @name + ' had an accident...'
    end

    if hungry?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + '\'s stomach grumbles...'
    end

    if poopy?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + ' does the potty dance...'
    end
  end


end

pet = Dragon.new 'Norbert'

command = -1
while command != "0"
  puts "Enter 'feed', 'put to bed', 'walk', 'toss', 'rock' or 0 to exit"
  command = gets.chomp.downcase
  case command
  when "feed"
    pet.feed
  when "walk"
    pet.walk
  when "put to bed"
    pet.putToBed
  when "toss"
    pet.toss
  when "rock"
    pet.rock
  when 0.to_s
    puts "Ok, Bye"
  else
    puts " What?"
  end

end
