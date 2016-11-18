# rps8.rb

# As long as the user doesn't quit, keep track of a history of moves 
# by both the human and computer. What data structure will you reach 
# for? Will you use a new class, or an existing class? What will the 
# display output look like?

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
  attr_accessor :move, :name, :score, :move_history

  def initialize
    @score = 0
    @move_history = []
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
      score_reset
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
      display_move_history
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
    puts "-------------------"
  end

  def score_reset
    human.score = 0
    computer.score = 0
  end
end

RPSGame.new.play
