# med1_3.rb

# Alan noticed that this will fail when update_quantity is called. 
# Since quantity is an instance variable, it must be accessed with 
# the @quantity notation when setting it. One way to fix this is to 
# change attr_reader to attr_accessor and change quantity to 
# self.quantity.

# Is there anything wrong with fixing it this way?

# Yes. The problem is this will expose write-ability to other methods
# and you may not want that.