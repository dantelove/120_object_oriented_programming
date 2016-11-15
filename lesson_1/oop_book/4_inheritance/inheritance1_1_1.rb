# inheritance1_1_1.rb

# 1.

# Create a superclass called Vehicle for your MyCar class to inherit 
# from and move the behavior that isn't specific to the MyCar class 
# to the superclass. Create a constant in your MyCar class that 
# stores information about the vehicle that makes it different from 
# other types of Vehicles.

# Then create a new class called MyTruck that inherits from your 
# superclass that also has a constant defined that separates it 
# from the MyCar class in some way.

module Haulable
  def can_haul?(lbs)
    lbs < 5000
  end
end

class Vehicle
  @@number_of_vehicles = 0

  attr_accessor :color, :model, :speed
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@number_of_vehicles += 1
  end

  def self.number_of_vehicles
    @@number_of_vehicles
  end

  def self.gas_mileage(miles, gas)
    mpg = miles / gas

    "Your car gets #{mpg} miles per gallon."
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

  def vehicle_age
    "#{age}"
  end

  private

  def age
    Time.now.year - year
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2

  include Haulable
end

impala = MyCar.new(2008, "blue", "Impala")
tahoe = MyTruck.new(2012, "white", "Tahoe")

puts impala
puts tahoe

tahoe.spray_paint("white")

# 2.

# Add a class variable to your superclass that can keep track of 
# the number of objects created that inherit from the superclass. 
# Create a method to print out the value of this class variable 
# as well.

p Vehicle.number_of_vehicles

# 3.

# Create a module that you can mix in to ONE of your subclasses 
# that describes a behavior unique to that subclass.

p tahoe.can_haul?(2500)

# 4.

# Print to the screen your method lookup for the classes that you 
# have created.

p MyCar.ancestors
p MyTruck.ancestors


# 5.

# Move all of the methods from the MyCar class that also pertain 
# to the MyTruck class into the Vehicle class. Make sure that all 
# of your previous method calls are working when you are finished.

# 6.

# Write a method called age that calls a private method to calculate 
# the age of the vehicle. Make sure the private method is not 
# available from outside of the class. You'll need to use Ruby's 
# built-in Time class to help.

p impala.vehicle_age
p tahoe.vehicle_age