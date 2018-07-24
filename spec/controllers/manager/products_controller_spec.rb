require 'rails_helper'

RSpec.describe Manager::ProductsController, type: :controller do
  describe 'GET /manager/products' do
    it 'return status 200' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /manager/products' do
    it 'return status 200' do
      category = create(:category)
      params = {
        product: {
          name: 'product',
          quantity: 10,
          description: '123',
          status: 1,
          price: 20,
          tag: 'product',
          category_id: category.id
        }
      }
      expect { post :create, params: params }.to change(Product, :count).by(1)
    end
  end

  describe 'DELETE /manager/products/:id' do
    it 'return status 200' do
      category = create(:category)
      product = create(:product, category_id: category.id)
      params = {
        id: product.id
      }
      expect { delete :destroy, params: params }.to change(Product, :count).by(-1)
    end
  end
end
