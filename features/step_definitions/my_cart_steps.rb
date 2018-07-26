When 'I go to the homepage' do
  visit root_path
end

Then 'I should see the From the blog' do
  expect(page).to have_selector('h2', text: /From the blog/i)
end