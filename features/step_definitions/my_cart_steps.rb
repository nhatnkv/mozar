When 'I go to the homepage' do
  visit root_path
end

Then 'I should see the My Cart' do
  expect(page).to have_content('My Cart')
end