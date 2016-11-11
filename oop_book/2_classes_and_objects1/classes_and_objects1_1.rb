# classes_and_objects1_1.rb

# 1. 

# Create a class called MyCar. When you initialize a new instance
# or object of the class, allow the user to define some instance 
# variables that tell us the year, color, and model of the car. 
# Create an instance variable that is set to 0 during instantiation 
# of the object to track the current speed of the car as well. 
# Create instance methods that allow the car to speed up, brake, 
# and shut the car off.

class MyCar
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
end

honda = MyCar.new(2010, "purple", "Civic")

honda.speed_up(25)
honda.brake(10)
honda.speed_up(60)
honda.brake(30)
honda.shut_off

# 2.

# Add an accessor method to your MyCar class to change and view 
# the color of your car. Then add an accessor method that allows 
# you to view, but not modify, the year of your car.

puts honda.color
puts honda.color = "yellow"
puts honda.color
puts honda.year
# p honda.year = 2011

# 3.

# You want to create a nice interface that allows you to accurately 
# describe the action you want your program to perform. Create a 
# method called spray_paint that can be called on an object and will 
# modify the color of the car.

puts honda.color
honda.spray_paint("blue")