# ttt5.rb

# Bonus Features: Computer AI: Defense

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals
  def initialize
    @squares = {}
    reset
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won_match?
    !!winning_marker
  end

  # returns the winning marker or returns nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def immediate_threat?
    markers = squares.select(&:marked?).collect(&:marker)
    markers.size == 2
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " ".freeze

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_accessor :marker, :score

  def initialize(marker)
    @marker = marker
    @score = 0
  end
end

class TTTGame
  HUMAN_MARKER = "X".freeze
  COMPUTER_MARKER = "O".freeze
  FIRST_TO_MOVE = HUMAN_MARKER
  POINTS_TO_WIN = 5

  attr_reader :board, :human, :computer

  def play
    display_welcome_message
    clear

    loop do
      display_board

      loop do
        loop do
          current_player_moves
          break if board.someone_won_match? || board.full?
          clear_screen_and_display_board if human_turn?
        end
        update_score
        display_board
        break if someone_won_game?
        reset
        display_board
      end
      clear_screen_and_display_board
      display_result
      break unless play_again?
      reset
      display_play_again_message
    end

    display_goodbye_message
  end

  private

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe!"
  end

  def display_current_score
    puts "Current Score: You #{human.score}. Computer #{computer.score}"
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ""
    puts "First to #{POINTS_TO_WIN} Points Wins!"
    puts ""
    display_current_score
    puts ""
    board.draw
    puts ""
  end

  def joinor(array, delimiter = ",", conjunction = "or")
    array.map! do |x|
      if array.last == x
        "#{conjunction} #{x}"
      else 
        "#{x}#{delimiter} "
      end
    end

    array.join
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys)}):"
    square = nil
    loop do
      square = gets.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    if board.immediate_threat?
      
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def update_score
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      @human.score += 1
    when computer.marker
      @computer.score += 1
    end
  end

  def someone_won_game?
    human.score == POINTS_TO_WIN || computer.score == POINTS_TO_WIN
  end

  def display_result
    if human.score == POINTS_TO_WIN
      puts "You Won!"
    else
      puts "Computer Won!"
    end
  end

  def play_again?
    ans = nil

    loop do
      puts "Would you like to play again? (y/n)"
      ans = gets.chomp.downcase
      break if ["y", "n"].include?(ans)
      puts "Sorry must be y or n"
    end

    ans == "y"
  end

  def clear
    system "clear"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end
end

# We'll begin a new game like this:

game = TTTGame.new
game.play
