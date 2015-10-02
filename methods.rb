
def play_game
  player_lives
  while true
    question_generator(operation_generator)

    answer_checker(player_answer)

    life_manager

    break if game_over?
  end
end
###############>>>> GENERATORS <<<##############################
def question_generator(arr)
 puts  "What is the answer to " + arr[0].to_s + arr[2].to_s + arr[1].to_s + "?"
end

def operation_generator
  op = ['*', '+', '-', '/']
  op_used = op.sample
  a = rand(20)
  b = rand(20)
  answer = a.send(op_used,b)

  $answer_string = answer.to_s
  return [a, b, op_used]
  
end
###################>>>>>ANSWER CHECKER / PLAYER ANSWER <<<<< ###############################
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

#################>>>>> GAME OVER? / LIFE CHECKER <<<< ###############
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
