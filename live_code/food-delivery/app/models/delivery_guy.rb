class DeliveryGuy < Employee
  def initialize(attributes = {})
    super
    @orders = []
  end

  def add_order()
    # Add an order to the delivery guy's orders
  end
end
