# easy3_5.rb

# What would happen if I called the methods like shown below?

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer # won't work; instance variable calling a class method
tv.model # works

Television.manufacturer # works
Television.model # won't work; class calling an instance method.