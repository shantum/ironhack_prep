
class Room
  attr_reader :name, :exits, :extras

  def initialize(name, exits, extras)
    @name = name
    @exits = exits
    @extras = extras
  end
end

central_room = Room.new('Central Room', ['N', 'S', 'E', 'W'], ['A secret key'])
north_room = Room.new('North Room', ['N', 'S'], ['A bear'])
south_room = Room.new('South Room', ['N', 'S'], ['A secret door'])
east_room = Room.new('East Room', ['W', 'E'], ['A dog'] )
west_room = Room.new('West Room', ['W', 'E'], ['A lot of light'])
outside = Room.new('Forest', ['N', 'S', 'E', 'W'], ['A deer'])

rooms = [central_room, north_room, south_room, east_room, west_room, outside]

class Game
  def initialize(rooms)
    @score = 0
    @rooms = rooms
    @current_room = @rooms[0]
    @inventory = []
  end

  def print_exits
    puts @current_room.exits
  end

  def print_extras
    puts @current_room.extras
  end

  def print_name
    puts @current_room.name
  end

  def print_all
    puts "Welcome to the #{@current_room.name}."
    puts "This room has the following exits: #{@current_room.exits.to_s}"
    puts "The following things are in the room: #{@current_room.extras}"
  end

  def print_instructions
    puts "Welcome to the game. You are in the central room. To move to
  	another room, please enter the direction in which you would like
  	to exit (N, S, E or W)."
  end

  def change_room(input)
    if @current_room == @rooms[0]
      if input == 'N'
        @current_room = @rooms[1];
      elsif input == 'S'
        @current_room = @rooms[2]
      elsif input == 'E'
        @current_room = @rooms[3]
      elsif input == 'W'
        @current_room = @rooms[4]
      else get_input
      end

    elsif @current_room == @rooms[1]
      if input == 'N'
        @current_room = @rooms[5];
      elsif input == 'S'
        @current_room = @rooms[0]
      else puts 'Invalid input. Please try again.'
      end

    elsif @current_room == @rooms[2]
      if input == 'N'
        @current_room = @rooms[0];
      elsif input == 'S'
        @current_room = @rooms[5]
      else puts 'Invalid input. Please try again.'
      end

    elsif @current_room == @rooms[3]
      if input == 'W'
        @current_room = @rooms[0];
      elsif input == 'E'
        @current_room = @rooms[5]
      else puts 'Invalid input. Please try again.'
      end

    elsif @current_room == @rooms[4]
      if input == 'W'
        @current_room = @rooms[5];
      elsif input == 'S'
        @current_room = @rooms[0]
      else puts 'Invalid input. Please try again.'
      end

    elsif @current_room == @rooms[5]
      if input == 'N'
        @current_room = @rooms[1];
      elsif input == 'S'
        @current_room = @rooms[2]
      elsif input == 'E'
        @current_room = @rooms[3]
      elsif input == 'W'
        @current_room = @rooms[4]
      else puts 'Invalid input. Please try again.'
      end
    end

    puts "You are now in the #{@current_room.name}"
    print_all
    get_input
  end



  def process_input(input)
    available_exits = @current_room.exits
    if available_exits.include? input
      change_room(input)
    elsif @current_room = @rooms[0] && input == "PICK UP THE KEY"
      puts "You have a key to a secret room!"; @score += 100; puts "Your score is now: #{@score}"; @inventory.push('Secret Key')
    elsif @current_room = @rooms[1] && input == "PET THE BEAR"
      puts "Oops! The bear attacked and killed you."; @score -= 100; puts "Your score is now: #{@score}"
    elsif @current_room = @rooms[2] && input == "OPEN SECRET DOOR"
      if @inventory.include? 'Secret Key'
        puts "Congrats! You have found a treasure!"; @score += 1000; puts "Your score is now: #{@score}"
      else puts "Sorry you dont have the secret key!"
      end
    elsif @current_room = @rooms[3] && input == "PLAY WITH DOG"
      puts "You and the dog are now friends!"; @score += 100; puts "Your score is now: #{@score}"
    elsif @current_room = @rooms[4] && input == "WEAR SUNGLASSES"
      puts "Cool moves!"; @score += 200; puts "Your score is now: #{@score}"
    elsif @current_room = @rooms[5] && input == "RUN AFTER DEER"
	  puts "You got lost in the woods :("; @score -= 200; puts "Your score is now: #{@score}"
	else puts 'Sorry, thats not a recognized input. Please try again!'
    end
    self.get_input
  end

  def get_input
    print 'What would you like to do?'
    print '>'
    input = gets.chomp.to_s.upcase!
    process_input(input)
  end
end

game1 = Game.new(rooms)
game1.get_input
