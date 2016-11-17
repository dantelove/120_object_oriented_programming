# rps5.rb

# RPS Binus Feautres: Keeping score

class Move
  VALUES = ["rock", "paper", "scissors"].freeze

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == "scissors"
  end

  def rock?
    @value == "rock"
  end

  def paper?
    @value == "paper"
  end

  def >(other_move)
    (rock? && other_move.scissors?)   ||
      (paper? && other_move.rock?)    ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?)       ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    @score = 0
    set_name
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What is your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a name."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ["R2D2", "Hal", "Deep Blue", "Number 5"].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors!"
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, please type y or n."
    end
    answer.start_with?("y")
  end

  def play
    display_welcome_message
    loop do
      loop do
        human.choose
        computer.choose
        display_moves
        display_match_winner
        update_score
        display_score
        break if game_winner?
      end
      display_game_winner
      break unless play_again?
    end
    display_goodbye_message
  end

  def update_score
    if human.move > computer.move
      human.score += 1
    elsif computer.move > human.move
      computer.score += 1
    end
  end

  def display_score
    puts "CURRENT SCORE: #{human.name} #{human.score} :" +
         " #{computer.name} #{computer.score}"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_match_winner
    if human.move > computer.move
      puts "#{human.name} Wins!"
    elsif human.move < computer.move
      puts "#{computer.name} Wins!"
    else
      puts "It's a tie!"
    end
  end

  def display_game_winner
    if human.score == 10
      puts "#{human.name} Wins Game!"
    elsif computer.score == 10
      puts "#{computer.name} Wins Game!"
    end
  end

  def game_winner?
    human.score == 10 || computer.score == 10
  end
end

RPSGame.new.play