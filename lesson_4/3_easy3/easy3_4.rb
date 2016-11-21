# easy3_4.rb

# How could we go about changing the to_s output on this method to 
# look like this: I am a tabby cat? (this is assuming that "tabby" 
# is the type we passed in during initialization).

class Cat
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{type} #{self.class.to_s.downcase}."
  end
end

tabby = Cat.new("tabby")

puts tabby