# easy5.rb

# Which of these two classes has an instance variable and how 
# do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# The Pizza class has an instance variable (@name). I know because of
# the @ symbol before the variable name. (The Fruit class only has
# a local variable - name.)