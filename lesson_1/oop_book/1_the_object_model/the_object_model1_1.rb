# the_object_model1_1.rb

# 1. How do we create an object in Ruby? Give an example of the 
# creation of an object.

# 2. What is a module? What is its purpose? How do we use them 
# with our classes? Create a module for the class you created 
# in exercise 1 and include it properly.

module Runable
  def can_sprint?
    @age < 70
  end
end

class MyClass
  include Runable

  def initialize(name, age)
    @name = name
    @age = age
  end

  def to_s
    @name
  end
end

bob = MyClass.new("Bob", 100)

p bob.can_sprint?
puts bob