class Player
  attr_accessor :lives, :win
  attr_reader :id
  def initialize(id)
    @id = id
    @lives = 3
  end
  def check_lives
    "P#{id}: #{lives}/3"
  end
  def get_player
    "Player #{id}: "
  end
end

class Turn
  attr_accessor :turn
  def initialize()
    @turn = 1
  end
end

class Question
  attr_accessor :answer
  def ask_question
    @number_1 = rand(1..20)
    @number_2 = rand(1..20)
    @answer = @number_1 + @number_2
    "What does #{@number_1} plus #{@number_2} equal?"
  end
end

game_ends = false
player_1 = Player.new(1)
player_2 = Player.new(2)
turn = Turn.new()
while !game_ends
  question = Question.new()
  if turn.turn == 1
    puts player_1.get_player() + question.ask_question()
    answer = gets.chomp
    if answer.to_i == question.answer
      puts player_1.get_player() + "YES! You are correct."
    end
    if answer.to_i != question.answer
      puts player_1.get_player() + "Seriously? No!"
      player_1.lives -= 1
    end
    turn.turn = 2
  elsif turn.turn == 2
    puts player_2.get_player() + question.ask_question()
    answer = gets.chomp
    if answer.to_i == question.answer
      puts player_2.get_player() + "YES! You are correct."
    end
    if answer.to_i != question.answer
      puts player_2.get_player() + "Seriously? No!"
      player_2.lives -= 1
    end
    turn.turn = 1
  end
  if player_1.lives == 0
    puts "Player 2 wins with a score of #{player_2.lives}/3"
    game_ends = true;
  elsif player_2.lives == 0
    puts "Player 1 wins with a score of #{player_1.lives}/3"
    game_ends = true;
  else
    puts player_1.check_lives() + " vs " + player_2.check_lives()
    puts "----- NEW TURN -----"
  end
end
puts "----- GAME OVER -----"
puts "Good bye!"