# easy2_7.rb

# Explain what the @@cats_count variable does and how it works. 
# What code would you need to write to test your theory?

# The @@cats_count class variable increments everytime a new 
# Cat object is instantiated. To test this theory I would have
# instainate multiple Cat objects and see if the @@cats_count
# varaible matched the number of Cat objects.

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

felix = Cat.new("cartoon")
garfield = Cat.new("cartoon")
tom = Cat.new("cartoon")

p Cat.cats_count
