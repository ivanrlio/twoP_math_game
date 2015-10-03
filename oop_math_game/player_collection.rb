require './player'
require 'pry'
class PlayerCollection


  def initialize
    @players = []

  end

  def display_player(name) # this works fully
    if @players == []
      puts "There are no players in the database!"
    else
      @players.each do |player|
        if player.name == name
          puts "Name: #{player.name} | Age: #{player.age} | Specialty: #{player.specialty}"
        else
          puts "#{name} was not found!"
        end
      end
    end
  end

  def display_all
    if @players == []
      puts "There are no players in the database!"
    else
      pp @players
    end
  end

  def add_player(name, age, specialty)
    add_player = Player.new(name, age, specialty)
    @players << add_player
    p "#{name} was added to the database!"
    p @players
  end

  def edit_player(name)
    @players.find do |player|
      if player.name == name
        puts "What would you like to edit? Type either 'name' or 'specialty'."
        command = gets.chomp
        case command
        when 'name'
          puts "Please enter your desired name."
          player.name = gets.chomp
          puts "Your name has been changed from #{name} to #{player.name}."
        when 'specialty'
          puts "Please enter your new specialty."
          player.specialty = gets.chomp
          puts "Your name has been changed from #{specialty} to #{player.specialty}."
        else
        end
      else 
        puts "A player by that name does not exist!"
      end
    end
  end
  
  def link_to_round(name)
    @players.each_with_index do |player, index|
      if player.name == name
        player.live
      else
        puts "A player with that name does not exist"
      end
    end


  end


  def delete_player(name) #loop through and slice player out
      if @players == []
        puts "The database is empty!"
      else
        @players.each_with_index do |player, index|
          if player.name == name
            @players.delete_at(index)
            puts "#{player.name} was successfully deleted!"
          else
            puts "A player by that name does not exist!"
          end
        end
      end
   
  end
end