# inheritance1_3_1.rb

# 8.

# the hi method definition is most likely currently located under 
# the 'private' keyword the problem can either be fixed by moving 
# the method definition above the private keyword or defining and 
# calling a public method with. the desired functionality.

class Person
  def hi
    "hi"
  end
end

bob = Person.new
p bob.hi