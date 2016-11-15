# classes_and_objects5.rb

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

  def to_s
    name
  end
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"