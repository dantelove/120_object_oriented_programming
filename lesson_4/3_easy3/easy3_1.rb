# easy3_1.rb

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

# hello = Hello.new
# hello.hi

# puts "Hello"

# hello = Hello.new
# hello.bye

# No method error because the Hello class does not have a bye method.

# hello = Hello.new
# hello.greet

# Wrong number of arguments given 0 expected 1.

# hello = Hello.new
# hello.greet("Goodbye")

# puts "Goodbye"

Hello.hi

# No method error. Trying to call an instance method on a class.