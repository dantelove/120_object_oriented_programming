# 21_1.rb

require "pry"

class Player
  attr_accessor :name, :first_card, :second_card
  
  def initialize
    @name = "Player"
    @first_card
    @second_card 
  end

  def deal
    @first_card = @deck.delete_at(rand(@deck.to_a.length))
    @second_card = @deck.delete_at(rand(@deck.to_a.length))
  end

  def hit
  end

  def stay
  end

  def stay
  end

  def busted?
  end

  def total
    # definitely looks like we need to know about "cards" 
    # to produce total.
  end
end

class Dealer
  attr_accessor :name, :first_card, :second_card
  
  def initialize
    @name = "Dealer"
    @first_card
    @second_card
  end

  def deal
    @first_card = @deck.delete_at(rand(@deck.length))
    @second_card = @deck.delete_at(rand(@deck.length))
  end

  def stay
  end

  def busted?
  end

  def total
  end
end

class Deck
  attr_accessor :deck

  def initialize
    @deck = create_deck
  end

  def create_deck
    a = (2..10).to_a + ["Jack", "Queen", "King", "Ace"]
    suits = ["Hearts", "Clubs", "Diamonds", "Spades"]

    results = []

    suits.each do |suit|
      results << a.map { |x| "#{x} of #{suit}"}
    end

    results.flatten
  end
end

class Card
  def initialize
  end
end

class Game

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    binding.pry
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end

  def deal_cards
    @dealer.deal
    @player.deal
  end

  def show_initial_cards
    puts "The #{player.name} is dealt the #{player.first_card} & #{player.second_card}."
    puts "The #{dealer.name} shows the #{dealer.first_card}."
  end

  def player_turn

  end

  def dealer_turn

  end

  def show_result

  end
end

Game.new.start