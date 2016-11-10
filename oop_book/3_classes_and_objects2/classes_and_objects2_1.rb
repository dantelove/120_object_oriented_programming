# classes_and_object2.rb

# 1.

# Add a class method to your MyCar class that calculates 
# the gas mileage of any car.

class MyCar
  attr_accessor :year, :color, :model, :speed

  def self.gas_mileage(miles_traveled, gallons_consumed)
    mpg = miles_traveled / gallons_consumed
    "The gas mileage of your car is #{mpg} MPG."
  end

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
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
end

mustang = MyCar.new(2017, "red", "Mustang")

puts MyCar.gas_mileage(320, 16)

puts mustang.to_s