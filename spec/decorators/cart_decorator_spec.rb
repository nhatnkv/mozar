require 'rails_helper'

RSpec.describe CartDecorator do
  before do
    DatabaseCleaner.strategy = :truncation
    @cart = create(:cart)
  end

  describe '.total_price' do
    it 'return total item price' do
      category = create(:category)
      product = create(:product, category_id: category.id, price: 10)
      line_item = create(:line_item,  product_id: product.id, cart_id: @cart.id, quantity: 5)
      expect(@cart.decorate.total_price).to eq(product.price * line_item.quantity)
    end
  end

  describe '.align_cart' do
    context 'when line_items is empty' do
      it 'return style text-align = center' do
        expect(@cart.decorate.align_cart).to eq('center')
      end
    end

    context 'when line_items is exists' do
      it "return style text-align = ''" do
        category = create(:category)
        product = create(:product, category_id: category.id, price: 10)
        line_item = create(:line_item,  product_id: product.id, cart_id: @cart.id, quantity: 5)
        expect(@cart.decorate.align_cart).to eq('')
      end
    end
  end
end
