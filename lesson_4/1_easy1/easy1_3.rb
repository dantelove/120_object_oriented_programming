# easy3.rb

# When we called the go_fast method from an instance of the Car 
# class (as shown below) you might have noticed that the string 
# printed when we go fast includes the name of the type of 
# vehicle we are using. How is this done?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

# The class is printed using string interpolation. By interpolating
# self.class we are calling to_s on the class name where the module
# is being invoked - in this case the Car class.