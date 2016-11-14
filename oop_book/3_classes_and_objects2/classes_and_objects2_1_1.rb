# classes_and_obects2_1.rb

class MyCar
  def self.gas_mileage(miles, gas)
    mpg = miles / gas

    "Your car gets #{mpg} miles per gallon."
  end

  attr_accessor :color, :model, :speed
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(num)
    self.speed += num
    puts "You step on the gas and accelerate to #{speed}MPH!"
  end

  def brake(num)
    self.speed -=num
    puts "You brake! You're now going #{speed}MPH."
  end

  def shut_off
    self.speed = 0
    puts "You park your car and turn it off."
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} #{model} looks great!"
  end

  def to_s
    "#{year} #{color} #{model}"
  end
end

honda = MyCar.new(2010, "purple", "Civic")

# 1

# Add a class method to your MyCar class that calculates the gas 
# mileage of any car.

p MyCar.gas_mileage(320, 16)

# 2

# Override the to_s method to create a user friendly print out 
# of your object.

puts honda