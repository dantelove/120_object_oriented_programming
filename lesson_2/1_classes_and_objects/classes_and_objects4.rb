# classes_and_objects4.rb

# Using the class definition from step #3, let's create a few more 
# people -- that is, Person objects.

class Person
  attr_accessor :name, :first_name, :last_name

  def initialize(name)
    @name = name
    @first_name = name.split[0]
    @last_name = name.split[1].nil? ? "" : name.split[1]
  end

  def last_name=(n)
    @last_name = n
    @name = "#{first_name} #{self.last_name}"
  end

  def name=(n)
    @name = n
    @first_name = n.split[0]
    @last_name = n.split[1].nil? ? "" : n.split[1]
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.name == rob.name