# easy3_2.rb

# If we call Hello.hi we get an error message. How would you fix this?

# I would fix by instantiating a variable of the Hello class and then
# calling hi on that instantiation.

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

hello = Hello.new

hello.hi