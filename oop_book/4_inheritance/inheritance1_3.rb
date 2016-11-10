# inheritance1_3.rb

class Person
  def initialize
  end

  private

  def hi
    puts "Hi"
  end
end

bob = Person.new
bob.hi

# Here we are attempting to call the private method hi on the 
# bob instance of the person class. In this scenario bob does not have
# access to that method (it is also possible it does not exist).

# This could be corrected by removing the reserved word private, or
# creating the method if it does not exist.