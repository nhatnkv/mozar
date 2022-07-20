require 'rails_helper'

RSpec.describe UpdateCart do
  let(:cart) { create(:cart) }
  let(:category) { create(:category) }
  let(:line_item) { create(:line_item, cart_id: cart.id, product_id: product.id) }
  let(:product) { create(:product, category_id: category.id) }
  let(:quantity) { {} }

  describe '.call' do
    it 'return line_item with quantity == 10' do
      quantity[line_item.id.to_s] = 10
      update_cart_service = UpdateCart.new cart, quantity
      update_cart_service.call
      expect(cart.line_items.first.quantity).to eq(quantity[line_item.id.to_s])
    end
  end
end
