# classes_and_objects3.rb

# Now create a smart name= method that can take just a first name 
# or a full name, and knows how to set the first_name and last_name 
# appropriately.

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

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'