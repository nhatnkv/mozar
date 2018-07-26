require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the HomesHelper. For example:
#
# describe HomesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe HomesHelper, type: :helper do
  before(:all) do
    @category = create(:category)
    @product = create(:product, category_id: @category.id)
    @image_main = @product.images.create(remote_img_url: 'https://cdn.leibish.com/media/gemstones/thumb_w800/gemstone-50525-ruby-pear-red-6a48e.jpg',
                                         tag: Image::TAG[:main])

    @image_assistant = @product.images.create(remote_img_url: 'http://spiritualzonshop.com/1029-home_default/ruby-manik.jpg',
                                              tag: Image::TAG[:assistant])
  end

  describe 'main image' do
    it 'return image tag = 1' do
      expect(helper.image_url(@product.images, 'main')).to eq(@image_main.img.url(:img_540x728))
    end

    it 'return image tag = 2' do
      expect(helper.image_url(@product.images, 'assistant')).to eq(@image_assistant.img.url(:img_540x728))
    end
  end
end
