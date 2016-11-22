# med1_6.rb

# What is the difference in the way the code works?

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# Code works the same. The first set doesn't need the attr_accessor,
# because it's using the instance variable directly (it would need
# an attr_reader for the template call on 13). The second set
# does need the self call in the show_template method because it's a
# getter rather than a setter method.