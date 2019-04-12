class Cart
  attr_reader :cart
  
  def initialize(cart)
    @cart = cart
  end

  def total_count
    #get the sum of all the values in the hash
    @cart.values.sum
  end
end
