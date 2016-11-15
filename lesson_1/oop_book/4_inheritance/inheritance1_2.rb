# inheritance1_2.rb

# 7

# Create a class 'Student' with attributes name and grade. 
# Do NOT make the grade getter public, so joe.grade will raise 
# an error. Create a better_grade_than? method, that you can call 
# like so...

class Student
  attr_reader :name, :grade

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(name)
    self.grade > name.grade
  end

  protected

  def grade
    @grade
  end
  
end

joe = Student.new("Joe", 100)
bob = Student.new("Bob", 75)

puts "Well done!" if joe.better_grade_than?(bob)

p joe.grade
