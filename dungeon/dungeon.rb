#Main wrapper class Dungeon
class Dungeon
  attr_accessor :player

#Create Dungeon instance, create a new Player and give it a name
  def initialize(player_name)
    @player = Player.new(player_name)
    @rooms = []
  end
#Method to add new room using the Room class to the Dungeon
  def add_room(reference, name, description, connections)
    @rooms << Room.new(reference, name, description, connections)
  end
#Methot to set the start location for the player
  def start(location)
    @player.location = location
    show_current_description
  end
#Show the description
  def show_current_description
    puts find_room_in_dungeon(@player.location).full_description
  end
#Method to find room in the dungeon from given reference
  def find_room_in_dungeon(reference)
    @rooms.detect { |room| room.reference == reference }
  end
#Method to find room by given direction
  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections[direction]
  end
#Method for player movement throug rooms inside dungeon
  def go(direction)
    puts "You go " + direction.to_s
    @player.location = find_room_in_direction(direction)
    show_current_description
  end

#Class to create Player instances to store name and location of the current player
  class Player
    attr_accessor :name, :location

    def initialize(name)
      @name = name
    end
  end

#Class Room to instatiate a room in the dungeon
  class Room
    attr_accessor :reference, :name, :description, :connections

    def initialize(reference, name, description, connections)
      @reference = reference
      @name = name
      @description = description
      @connections = connections
    end

    def full_description
      @name + "\n\nYou are in " + @description
    end
  end


end

# Create the main dungeon object
my_dungeon = Dungeon.new("Fred Bloggs")

# Add rooms to the dungeon
my_dungeon.add_room(:largecave, "Large Cave", "a large cavernous cave", { ➥:west => :smallcave })
my_dungeon.add_room(:smallcave, "Small Cave", "a small, claustrophobic cave", { ➥:east => :largecave })

# Start the dungeon by placing the player in the large cave
my_dungeon.start(:largecave)
