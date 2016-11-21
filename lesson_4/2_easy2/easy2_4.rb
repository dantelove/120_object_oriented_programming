# easy2_4.rb

# What could you add to this class to simplify it and remove two 
# methods from the class definition while still maintaining the 
# same functionality?

# You replace the individual getter and setter methods with an
# attr_accessor method like so:

class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

beeswax = BeesWax.new("honey")
p beeswax.type
p beeswax.type = "yellow"
p beeswax.type