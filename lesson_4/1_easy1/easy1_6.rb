# easy6.rb

# What could we add to the class below to access the instance 
# variable @volume?

# We could add an attr_accessor to access the instance variable
# @volume.

class Cube
  attr_accessor :volume
  def initialize(volume)
    @volume = volume
  end
end

cube = Cube.new(100)
p cube.volume