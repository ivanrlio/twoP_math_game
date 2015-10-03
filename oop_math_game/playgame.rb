require './player_collection'
require './generator'

class PlayGame

  def player_names
    puts "Player 1, what is your name?"
    player1 = gets.chomp
    @player1_name = @players.collection.link_to_round(player1)

    puts "Player 2, what is your name?"
    player2 = gets.chomp
    @player2_name = @players.collecetion.link_to_round(player2)

  end

  def player_answer
    puts "Player 1, what is your answer?"
    g1 = gets.chomp

    puts "Player 2, what is your answer?"
    g2 = gets.chomp

    return [g1, g2]

  end


  def answer_checker(guesses)

    if guesses[0] == $answer_string && guesses[1] == $answer_string
      puts "Well done, you both got it right! The answer was #{$answer_string}"
    elsif guesses[0] == $answer_string && guesses[1] != $answer_string
      puts "Well done Player 1, you got it right! The answer was #{$answer_string}. Player 2 you lose a life! "
      $player_2_lives -= 1
    elsif guesses[0] != $answer_string && guesses[1] == $answer_string
      puts "Well done Player 2, you got it right! The answer was #{$answer_string}. Player 1 you lose a life! "
      $player_1_lives -= 1
    else
      puts "You both got it wrong! The answer was " + $answer_string + ". You both lose lives :("
      $player_2_lives -= 1
      $player_1_lives -= 1
    end
  end


  def life_manager
    puts "Player 1, you have " + $player_1_lives.to_s + " lives left! Player 2, you have " + $player_2_lives.to_s + " lives left."
  end

  def player_lives
    $player_1_lives = 3
    $player_2_lives = 3
  end

  def game_over?
    if $player_1_lives == 0 || $player_2_lives == 0
      return true
    else
      return false
    end
  end
end






