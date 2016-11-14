# inheritance1_2_1.rb

# 7

# Create a class 'Student' with attributes name and grade. 
# Do NOT make the grade getter public, so joe.grade will raise an 
# error. Create a better_grade_than? method, that you can call like 
# so...

class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(student)
    self.grade > student.grade
  end

  protected

  def grade
    @grade
  end
end

steve = Student.new("Steve", 98)
bob = Student.new("Bob", 76)

p steve.better_grade_than?(bob)
p bob.grade