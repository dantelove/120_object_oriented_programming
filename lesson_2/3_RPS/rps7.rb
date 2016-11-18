# rps7.rb

# What would happen if we went even further and introduced 5 
# more classes, one for each move: Rock, Paper, Scissors, Lizard, 
# and Spock. How would the code change? Can you make it work? 
# After you're done, can you talk about whether this was a good 
# design decision? What are the pros/cons?

# Trade-offs of this approach: On the one hand, we unpacked the
# comparison logic in the ">" and "<" methods in the move class.
# Much easier to follow now. On the other, we did have to add
# a lengthier case statement to both Human and Player class
# choose methods. That said, I think this is ultimately easier to
# read, and as such consider it an improvement.

class Move
  VALUES = ["rock", "paper", "scissors", "lizard", "spock"].freeze

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
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    
    case choice
    when "rock"
      self.move = Rock.new(choice)
    when "paper"
      self.move = Paper.new(choice)
    when "scissors"
      self.move = Scissors.new(choice)
    when "lizard"
      self.move = Lizard.new(choice)
    when "spock"
      self.move = Spock.new(choice)
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
    when "paper"
      self.move = Paper.new(choice)
    when "scissors"
      self.move = Scissors.new(choice)
    when "lizard"
      self.move = Lizard.new(choice)
    when "spock"
      self.move = Spock.new(choice)
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
