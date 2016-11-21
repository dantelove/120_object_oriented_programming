# easy2_2.rb

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# The result will be "You will" concatenated with one of the three
# roadtrip choices.

trip = RoadTrip.new
p trip.predict_the_future

