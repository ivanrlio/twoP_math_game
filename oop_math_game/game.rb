require './player_collection'
require './generator'
require './playgame'

class PlayerInterface

  def initialize
    @players_collection = PlayerCollection.new
    @generator = Generator.new
    @play = PlayGame.new

  end

  def game_start #this works
    while true
      puts "What would you like to do? Either: 'play', 'display player', 'display all players' 'add player', 'edit player' ,'delete player' or 'quit'."
      command = gets.chomp
      case command
      when 'play' then game_play
      when 'display all players' then game_display_all_players
      when 'display player' then game_display_player
      when 'add player' then game_add_player
      when 'edit player' then game_edit_player
      when 'delete player' then game_delete_player
      when 'quit' then game_quit
      else puts 'Command is not recognized.'
      end 
    end
  end

  def game_play
    @play.player_names
    puts @generator.question

    

    #what is your name? --> search database, if correct, create variable that takes their object, else, 'prompt to add player'
    #ask player qusetion and store in variable, use answer_checker to compare, then remove life from instance 


  end


  def game_display_all_players #code works but displaying object id, not object
    @players_collection.display_all
  end


  def game_display_player #this works fully
     puts "What is the name of the player you would like to find?"
     name = gets.downcase.chomp
     @players_collection.display_player(name)
     
  end


  def game_add_player #this works fully
    print "Enter new player name:"
    name = gets.downcase.chomp
    print "Enter your age:"
    age = gets.downcase.chomp
    print "Enter your specialty, i.e. 'Division', 'Subtraction', 'Addition', 'Multiplication'."
    specialty = gets.downcase.chomp
    @players_collection.add_player(name, age, specialty)


  end

  def game_edit_player # this works fully
    puts "Which player would you like to edit?"
    name = gets.downcase.chomp
    @players_collection.edit_player(name)
  end

  def game_delete_player # this works fully
    puts "Which player would you like to delete?"
    name = gets.downcase.chomp
    @players_collection.delete_player(name)
  end

  def game_quit
    #QUIT the game
    return false
  end

end