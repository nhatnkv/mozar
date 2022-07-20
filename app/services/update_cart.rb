class UpdateCart
  include Callable
  attr_reader :cart, :quantity

  def initialize cart, quantity
    @cart = cart
    @quantity = quantity
  end

  def call
    line_items = cart.line_items.to_a
    line_items.each do |line_item|
      line_item.update(quantity: quantity[line_item.id.to_s].to_i)
    end
  end
end
