# rps9.rb

# Come up with some rules based on the history of moves in order for 
# the computer to make a future move. For example, if the human 
# tends to win over 60% of his hands when the computer chooses 
# "rock", then decrease the likelihood of choosing "rock". 
# You'll have to first come up with a rule (like the one in the 
# previous sentence), then implement some analysis on history to 
# see if the history matches that rule, then adjust the weight of 
# each choice, and finally have the computer consider the weight of 
# each choice when making the move. Right now, the computer has a 
# 33% chance to make any of the 3 moves.

class Move
  VALUES = ["rock", "paper", "scissors", "lizard", "spock"].freeze

  def initialize(value)
    @value = value
    @number_of_moves = 0
    @history_of_moves = {}
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

  def lizard?
    @value == "lizard"
  end

  def spock?
    @value == "spock"
  end

  def to_s
    @value
  end
end

class Rock < Move
  def initialize(value)
    super
  end

  def <(other_move)
    other_move.paper? || other_move.spock?
  end

  def >(other_move)
    other_move.scissors? || other_move.lizard?
  end
end

class Paper < Move
  def initialize(value)
    super
  end

  def <(other_move)
    other_move.lizard? || other_move.scissors?
  end

  def >(other_move)
    other_move.spock? || other_move.rock? 
  end
end

class Scissors < Move
  def initialize(value)
    super
  end

  def <(other_move)
    other_move.spock? || other_move.rock?
  end

  def >(other_move)
    other_move.paper? || other_move.lizard?
  end
end

class Lizard < Move
  def initialize(value)
    super
  end

  def <(other_move)
    other_move.rock? || other_move.scissors?
  end

  def >(other_move)
    other_move.spock? || other_move.paper?
  end
end

class Spock < Move
  def initialize(value)
    super
  end

  def <(other_move)
    other_move.lizard? || other_move.paper?
  end

  def >(other_move)
    other_move.scissors?  || other_move.rock?
  end
end

class Player
  attr_accessor :move, :name, :score, :move_history, :result_history

  def initialize
    @score = 0
    @move_history = []
    @result_history = []
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
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    
    case choice
    when "rock"
      self.move = Rock.new(choice)
      self.move_history << "rock"
    when "paper"
      self.move = Paper.new(choice)
      self.move_history << "paper"
    when "scissors"
      self.move = Scissors.new(choice)
      self.move_history << "scissors"
    when "lizard"
      self.move = Lizard.new(choice)
      self.move_history << "lizard"
    when "spock"
      self.move = Spock.new(choice)
      self.move_history << "spock"
    end
  end
end

class Computer < Player
  def set_name
    self.name = ["R2D2", "Hal", "Deep Blue", "Number 5"].sample
  end

  def choose
    choice = Move::VALUES.sample
    
    case choice
    when "rock"
      self.move = Rock.new(choice)
      self.move_history << "rock"
    when "paper"
      self.move = Paper.new(choice)
      self.move_history << "paper"
    when "scissors"
      self.move = Scissors.new(choice)
      self.move_history << "scissors"
    when "lizard"
      self.move = Lizard.new(choice)
      self.move_history << "lizard"
    when "spock"
      self.move = Spock.new(choice)
      self.move_history << "spock"
    end
  end

  def compile_move_history
    hash = {
              rock:     { won: 0, lost: 0, tie: 0 },
              paper:    { won: 0, lost: 0, tie: 0 },
              scissors: { won: 0, lost: 0, tie: 0 },
              lizard:   { won: 0, lost: 0, tie: 0 },
              spock:    { won: 0, lost: 0, tie: 0 }

    }

    array = (move_history).zip(result_history)

    array.each do |x,y|
      case x
      when "rock"
        if y == "won"
          hash[:rock][:won] += 1
        elsif y == "lost"
          hash[:rock][:lost] += 1
        else
          hash[:rock][:tie] += 1
        end
      when "paper"
        if y == "won"
          hash[:paper][:won] += 1
        elsif y == "lost"
          hash[:paper][:lost] += 1
        else
          hash[:paper][:tie] += 1
        end
      when "scissors"
        if y == "won"
          hash[:scissors][:won] += 1
        elsif y == "lost"
          hash[:scissors][:lost] += 1
        else
          hash[:scissors][:tie] += 1
        end
      when "lizard"
        if y == "won"
          hash[:lizard][:won] += 1
        elsif y == "lost"
          hash[:lizard][:lost] += 1
        else
          hash[:lizard][:tie] += 1
        end
      when "spock"
        if y == "won"
          hash[:spock][:won] += 1
        elsif y == "lost"
          hash[:spock][:lost] += 1
        else
          hash[:spock][:tie] += 1
        end
      end
    end

    hash
  end
end

class RPSGame
  attr_accessor :human, :computer

  POINTS_TO_WIN = 3

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
      score_reset
      loop do
        human.choose
        computer.choose
        display_moves
        display_match_winner
        update_score
        update_result_history
        display_score
        break if game_winner?
      end
      display_game_winner
      display_move_history
      display_result_history
      display_compiled_move_history
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

  def update_result_history
    if human.move > computer.move
      human.result_history << "won"
      computer.result_history << "lost"
    elsif computer.move > human.move
      human.result_history << "lost"
      computer.result_history << "won"
    else
      human.result_history << "tie"
      computer.result_history << "tie"
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
    if human.score == POINTS_TO_WIN
      puts "#{human.name} Wins Game!"
    elsif computer.score == POINTS_TO_WIN
      puts "#{computer.name} Wins Game!"
    end
  end

  def game_winner?
    human.score == POINTS_TO_WIN || computer.score == POINTS_TO_WIN
  end

  def display_move_history
    puts "-------------------"
    puts "#{human.name} Move History:"
    human.move_history.each_with_index do |x, idx|
      puts "#{idx + 1}. #{x}"
    end
    puts "-------------------"
    puts "#{computer.name} Move History:"
    computer.move_history.each_with_index do |x, idx|
      puts "#{idx + 1}. #{x}"
    end
  end

  def display_result_history
    puts "-------------------"
    puts "#{human.name} Result History:"
    human.result_history.each_with_index do |x, idx|
      puts "#{idx + 1}. #{x}"
    end
    puts "-------------------"
    puts "#{computer.name} Result History:"
    computer.result_history.each_with_index do |x, idx|
      puts "#{idx + 1}. #{x}"
    end
    puts "-------------------"
  end

  def score_reset
    human.score = 0
    computer.score = 0
  end

  def display_compiled_move_history
  puts "#{computer.name} Results by Move:"
    computer.compile_move_history.each do |k, v|
      puts "#{k} #{v}"
    end
  puts "-------------------"
  end
end

RPSGame.new.play