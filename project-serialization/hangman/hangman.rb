require 'yaml'
class Hangman
  def initialize(name)
    @name = name
    @secret_word = random_secret_word
    @guesses_left = 0
    @incorrect_guesses = []
  end

  def random_secret_word
    file_name = "5desk.txt"
    # words = File.read(file_name).split("\r\n").select { |word| word.length.between?(5,12)}
    words = File.readlines(file_name).select { |word| word.length.between?(5,12) }
    words.sample.strip.downcase
  end

  def put_letters_hash
    hash_letters = Hash.new(0)
    @secret_word.each_char { |char| hash_letters[char] += 1}
    hash_letters
  end

  def reduce_visible_letters(hash, num)
    a = hash.values.inject { |res,n| res += n}
    if a > num
      hash.delete(hash.key(hash.values.sort[0]))
    else
      return hash
    end
    reduce_visible_letters(hash, num)
  end

  def display(str)
    @secret_word.gsub(/[^#{str}]/, "_")
  end

  def save_file
    f = File.open("save_game.yml", "w") unless File.exists?("save_game.yml")
    f.puts(YAML::dump(self))
    f.close
  end

  def config
    @letters_hash = put_letters_hash
    number_of_visible_letters = @letters_hash.length / 2
    init_visible_letters = @letters_hash.to_a.sample(number_of_visible_letters).to_h
    @visible_letters = reduce_visible_letters(init_visible_letters, number_of_visible_letters)

    puts "\n#{@secret_word}\n"
    puts display(@visible_letters.keys.join(""))

    @guesses_left = (@letters_hash.length - @visible_letters.keys.length) + 5

  end

  def start
    @guesses_left.times do
      break if @secret_word == display(@visible_letters.keys.join(""))
      break if (@letters_hash.length - @visible_letters.keys.length) > @guesses_left

      puts "\n#{display(@visible_letters.keys.join(""))}\n"
      puts "Incorect guesses: #{@incorrect_guesses.join(", ")}\n"

      print "\nguess letter or type 'save' to save the game: "
      guess = gets.chomp

      save_file if guess == "save"
      if guess.length > 1
        puts "Thats not single letter."
        redo
      end

      if @secret_word.include?(guess)
        @visible_letters[guess] = @secret_word.count(guess)
      else
        @incorrect_guesses << guess
      end
      @guesses_left -= 1
    end

    if @secret_word == display(@visible_letters.keys.join(""))
      puts "\nYou Won. The secret word is #{@secret_word}"
    else
      puts "\nYou Lose. The secret word is #{@secret_word}"
    end
  end
end


def load_file
  game = YAML::load_file("save_game.yml")
end 


print "\nInput name: "
name = gets.chomp

game = Hangman.new(name)

puts "\n Hello #{name}, Type 'load' to load previous game, or enter to play a new game."
load_game = gets.chomp
load_game = load_game == "load" ? true : false

if load_game
  game = load_file
  game.start
else
  game.config
  game.start
end
