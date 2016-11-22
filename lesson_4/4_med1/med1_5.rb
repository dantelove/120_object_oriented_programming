# med1_5.rb

class KrispyKreme
  attr_accessor :filling_type, :glazing

  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
    set_attributes
  end

  def set_attributes
    if filling_type.nil?
      self.filling_type = "Plain"
    end
  end

  def to_s
    return "#{filling_type} with #{glazing}" unless glazing.nil?
    "#{filling_type}"
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
puts donut2
puts donut3
puts donut4
puts donut5