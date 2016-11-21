# easy2_9.rb

# What would happen if we added a play method to the Bingo class, 
# keeping in mind that there is already a method of this name in 
# the Game class that the Bingo class inherits from.

# Creating a play method in the Bingo class would override the play 
# method from the game class.

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end

  def play
    puts "Begin Bingo!"
  end
end

bingo = Bingo.new
bingo.play