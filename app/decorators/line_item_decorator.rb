class LineItemDecorator < Draper::Decorator
  delegate_all

  def total_price
    product.price * quantity
  end
end
