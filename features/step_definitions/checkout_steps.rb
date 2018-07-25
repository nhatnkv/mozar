When 'I hover My Cart' do
  page.find('ul.header-r-cart').hover
end

Then 'I shouldnt be see any item in cart and checkout button' do
  expect(page.find('.cart-buttons a')).to have_content('Checkout')
end

When 'I click on checkout button' do
  page.find('.cart-buttons a').click
end

Then 'I should be redirected to homepage' do
  expect(page).to have_current_path(root_path)
end

When 'I add first product to cart' do
  sleep(5)
  page.find('div#div-item-1').hover
  page.find('div#div-item-1 i.fa-shopping-cart').click
end

When 'I scroll to top page' do
  page.execute_script("$(window).scrollTop(0, 0)")
end

Then 'I should be see alert add item to success' do
  expect(page).to have_selector('.alert-success', count: 1)
end

Then 'I should be see item in cart' do
  expect(page).to have_selector('.cart-products', count: 1)
end

Then 'I should be go to checkout page' do
  expect(page).to have_current_path(new_order_path)
end