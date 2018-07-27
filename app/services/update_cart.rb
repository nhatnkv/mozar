class UpdateCart
  def initialize cart
    @cart = cart
  end

  def call quantity_product
    line_items = @cart.line_items.to_a
    line_items.each do |line_item|
      line_item.update(quantity: quantity_product[line_item.id.to_s].to_i)
    end
  end
end
