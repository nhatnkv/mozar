require 'rails_helper'

RSpec.describe LineItemDecorator do
  describe '.total_price' do
    it 'return total product price' do
      cart = create(:cart)
      category = create(:category)
      product = create(:product, category_id: category.id, price: 10)
      line_item = create(:line_item, product_id: product.id, cart_id: cart.id, quantity: 10)
      expect(line_item.decorate.total_price).to eq(product.price * line_item.quantity)
    end
  end
end
