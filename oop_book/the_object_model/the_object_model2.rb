# the_object_model2.rb

# What is a module? What is its purpose? How do we use them 
# with our classes? Create a module for the class you created in 
# exercise 1 and include it properly.

# A module is a collection of behaviors that is useable in other classes
# via mixins.

# A module's purpose is to extend the functionality of mulitple classes
# in the same way.

module Speak
  def speak(string)
    puts "#{string}"
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new
sparky.speak("Arf!")
bob = HumanBeing.new
bob.speak("Hello!")