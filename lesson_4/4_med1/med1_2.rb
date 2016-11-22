# med1_2.rb

# Alyssa created the following code to keep track of items for a 
# shopping cart application she's writing:

# Alan looked at the code and spotted a mistake. "This will fail 
# when update_quantity is called", he says.

# Can you spot the mistake and how to address it?

class InvoiceEntry
  attr_accessor :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

# Since Alyssa used an attr_reader, the quantity variable setter 
# method is not exposed and as such not avaialble to her 
# update_quantity method.

# This can be address by exchanging the attr_reader with an 
# attr_accessor.