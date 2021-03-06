# rps_10.rb

# We have a list of robot names for our Computer class, but other 
# than the name, there's really nothing different about each of 
# them. It'd be interesting to explore how to build different 
# personalities for each robot. For example, R2D2 can always choose 
# "rock". Or, "Hal" can have a very high tendency to choose 
# "scissors", and rarely "rock", but never "paper". 
# You can come up with the rules or personalities for each robot. 
# How would you approach a feature like this?

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
  attr_accessor :move, :name, :score, :move_history, :result_history,
                :total_moves

  def initialize
    @score = 0
    @move_history = []
    @result_history = []
    @total_moves = 0
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
      self.total_moves += 1
    when "paper"
      self.move = Paper.new(choice)
      self.move_history << "paper"
      self.total_moves += 1
    when "scissors"
      self.move = Scissors.new(choice)
      self.move_history << "scissors"
      self.total_moves += 1
    when "lizard"
      self.move = Lizard.new(choice)
      self.move_history << "lizard"
      self.total_moves += 1
    when "spock"
      self.move = Spock.new(choice)
      self.move_history << "spock"
      self.total_moves += 1
    end
  end
end

class Computer < Player
  attr_accessor :move_values
  
  def initialize
    super
    @move_values = []
  end

  # def update_move_values
  #   values = ["rock", "paper", "scissors", "lizard", "spock"]

  #   values.each do |x|
  #     5.times do 
  #       self.move_values << x
  #     end
  #   end
  # end

  # def choose
  #   choice = move_values.sample

  #   case choice
  #   when "rock"
  #     self.move = Rock.new(choice)
  #     self.move_history << "rock"
  #     self.total_moves += 1
  #   when "paper"
  #     self.move = Paper.new(choice)
  #     self.move_history << "paper"
  #     self.total_moves += 1
  #   when "scissors"
  #     self.move = Scissors.new(choice)
  #     self.move_history << "scissors"
  #     self.total_moves += 1
  #   when "lizard"
  #     self.move = Lizard.new(choice)
  #     self.move_history << "lizard"
  #     self.total_moves += 1
  #   when "spock"
  #     self.move = Spock.new(choice)
  #     self.move_history << "spock"
  #     self.total_moves += 1
  #   end
  # end

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
          self.move_values << "rock"
        elsif y == "lost"
          hash[:rock][:lost] += 1
          self.move_values.delete_at(move_values.index("rock") || move_values.length )
        else
          hash[:rock][:tie] += 1
        end
      when "paper"
        if y == "won"
          hash[:paper][:won] += 1
          self.move_values << "paper"
        elsif y == "lost"
          hash[:paper][:lost] += 1
          self.move_values.delete_at(move_values.index("paper") || move_values.length )
        else
          hash[:paper][:tie] += 1
        end
      when "scissors"
        if y == "won"
          hash[:scissors][:won] += 1
          self.move_values << "scissors"
        elsif y == "lost"
          hash[:scissors][:lost] += 1
          self.move_values.delete_at(move_values.index("scissors") || move_values.length )
        else
          hash[:scissors][:tie] += 1
        end
      when "lizard"
        if y == "won"
          hash[:lizard][:won] += 1
          self.move_values << "lizard"
        elsif y == "lost"
          hash[:lizard][:lost] += 1
          self.move_values.delete_at(move_values.index("lizard") || move_values.length )
        else
          hash[:lizard][:tie] += 1
        end
      when "spock"
        if y == "won"
          hash[:spock][:won] += 1
          self.move_values << "spock"
        elsif y == "lost"
          hash[:spock][:lost] += 1
          self.move_values.delete_at(move_values.index("spock") || move_values.length )
        else
          hash[:spock][:tie] += 1
        end
      end
    end

    hash
  end
end

class R2D2 < Computer
  def set_name
    self.name = "R2D2"
  end

  def choose
    self.move = Rock.new("rock")
  end
end

class Hal < Computer
  def set_name
    self.name = "Hal"
  end

  def choose
    choice = ["scissors", "scissors", "scissors", 
              "scissors", "scissors", "rock"].sample

    case choice
    when "scissors" then self.move = Scissors.new(choice)
    when "rock"     then self.move = Rock.new(choice)
    end
      
  end
end

class DeepBlue < Computer
  def set_name
    self.name = "Depp Blue"
  end

  def choose
    self.move = Spock.new("spock")
  end
end

class Number5 < Computer
  def set_name
    self.name = "Number 5"
  end

  def choose
    self.move = Lizard.new("lizard")
  end
end

class RPSGame
  attr_accessor :human, :computer

  POINTS_TO_WIN = 3

  def initialize
    @human = Human.new
    @computer = [R2D2.new, Hal.new, DeepBlue.new, Number5.new].sample
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
      # computer.update_move_values
      loop do
        human.choose
        computer.choose
        display_moves
        display_match_winner
        update_score
        # update_result_history
        display_score
        break if game_winner?
      end
      display_game_winner
      display_move_history
      display_result_history
      #display_compiled_move_history
      #display_move_values
      #total_moves
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

  def total_moves
    puts "Total Moves by #{computer.name}: #{computer.total_moves}"

    puts "-------------------"
  end

  def display_move_values
    puts "#{computer.name} Choice Probability:"

    results = {}
    computer.move_values.each do |x|
      results[x] = computer.move_values.count(x)
    end
    results.each do |k,v|
      puts "#{k} : #{(v.to_f / computer.move_values.size*100).round(0)}%"
    end

    puts "-------------------"
  end
end

RPSGame.new.play