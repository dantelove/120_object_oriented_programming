# inheritance1_1.rb

# Exercises 1 - 6

# 1

# Create a superclass called Vehicle for your MyCar class to 
# inherit from and move the behavior that isn't specific to the 
# MyCar class to the superclass. Create a constant in your MyCar 
# class that stores information about the vehicle that makes it 
#   different from other types of Vehicles.

# Then create a new class called MyTruck that inherits from your 
# superclass that also has a constant defined that separates it 
# from the MyCar class in some way.

module Openable
  def open_truck_bed
    truck_bed_open = true
  end

  def close_truck_bed
    truck_bed_open = false
  end
end

class Vehicle
  attr_accessor :year, :color, :model, :speed
  @@number_of_inheriting_objects = 0

  def self.inheriting_objects_counter
    @@number_of_inheriting_objects
  end

  def self.gas_mileage(miles_traveled, gallons_consumed)
    mpg = miles_traveled / gallons_consumed
    "The gas mileage of your car is #{mpg} MPG."
  end

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@number_of_inheriting_objects += 1
  end

  def speed_up(num)
    self.speed += num
  end

  def brake(num)
    self.speed -= num
  end

  def shut_off
    self.speed = 0
  end

  def spray_paint(color)
    self.color = color
  end

  def to_s
    "#{year} #{color} #{model}"
  end

  def age
    "#{years_old}"
  end

  private

  def years_old
    Time.now.year - self.year 
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2

  include Openable
end

car = MyCar.new(2011, "blue", "Impala")
truck = MyTruck.new(2020, "white", "Space Truck")

p car.to_s
p truck.to_s

# 2

# Add a class variable to your superclass that can keep track of 
# the number of objects created that inherit from the superclass. 
# Create a method to print out the value of this class variable as 
# well.

Vehicle.inheriting_objects_counter

# 3

# Create a module that you can mix in to ONE of your subclasses 
# that describes a behavior unique to that subclass.

p truck.open_truck_bed

# 4

# Print to the screen the your method lookup for the classes 
# that you have created.

p Vehicle.ancestors
p MyCar.ancestors
p MyTruck.ancestors

# 5

# Move all of the methods from the MyCar class that also pertain 
# to the MyTruck class into the Vehicle class. Make sure that all 
# of your previous method calls are working when you are finished.

# 6

# Write a method called age that calls a private method to calculate 
# the age of the vehicle. Make sure the private method is not 
# available from outside of the class. You'll need to use Ruby's 
# built-in Time class to help.

p car.age
p truck.age
