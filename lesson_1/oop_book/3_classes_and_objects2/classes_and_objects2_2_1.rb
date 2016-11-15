# classes_and_objects2_2_1.rb

# The initial error was caused by the setter method not having access
# to the name instance variable. This was corrected below by changing 
# the attr_reader to attr_accessor - which gives the attr the ability 
# to both read an overwrite instance variable information

class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

p bob.name