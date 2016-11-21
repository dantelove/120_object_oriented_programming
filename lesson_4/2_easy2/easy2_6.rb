# easy2_6.rb

# Which one of these is a class method (if any) and how do you 
# know? How would you call a class method?

class Television
  def self.manufacturer
    "Vizio"
  end

  def model
    # method logic
  end
end

# self.manufacturer is a class method, because self in the method
# definition refers to the class itself (Television). It would be
# called like so:

p Television.manufacturer