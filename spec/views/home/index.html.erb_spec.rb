require 'rails_helper'

RSpec.describe "home/index", type: :view do
  before do 
    category = create(:category)
    create_list(:product, 5, category_id: category.id)
    @products = Product.all
    render template: "homes/index.html.erb"
  end

  describe 'have content' do
    it "displays 'from the blog' text" do
      expect(rendered).to have_content 'From the blog'
    end

    it "displays 'New Products' text" do
      expect(rendered).to have_content 'New Products'
    end
  end
end
