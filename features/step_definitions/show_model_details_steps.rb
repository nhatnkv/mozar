def create_product(number)
  category = FactoryGirl.create(:category)
  @products = FactoryGirl.create_list(:product, number, category_id: category.id)
end

def create_image
  @products.each do |product|
    Image.create(remote_img_url: "https://content.diamondnexus.com/media/catalog/product/cache/1/image/600x/9df78eab33525d08d6e5fb8d27136e95/e/m/emerald-ruby.jpg",
      title: FFaker::CheesyLingo.title, tag: 1, product_id: product.id)
  end
end

Given(/^there are ([0-9]*) products in the application$/) do |number|
  create_product(number.to_i)
  create_image
end

When 'I go to the list products' do
  visit root_path
end

When 'I scroll to new product tag' do
  page.execute_script("$('html,body').animate({
                        scrollTop: $('.product-area-home-three').offset().top
                      }, 'slow');")
end

Then(/^I should be see ([0-9]*) new products$/) do |number|
  expect(page).to have_selector('li.quickview', count: number)
end

When 'I click on product with ID#item-5' do
  sleep(5)
  page.find('li#item-5').hover
  page.find('li#item-5 a').click
end

Then 'I should see popup of that product detail togged' do
  expect(page).to have_content('See all features')
end
