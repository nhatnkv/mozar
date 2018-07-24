Feature: Check Out
  If user click to checkout button when cart is empty
  Return homepage

Background: there are many products
  Given there are five products in the application
  
@javascript
Scenario: Return root page when cart hasnt item
When I go to the homepage
Then I should see the My Cart
When I hover My Cart
Then I dont see any item in cart and checkout button
When I click on checkout button
Then I return homepage


@javascript
Scenario: Go to checkout page when cart has item
When I go to the homepage
Then I should see the My Cart
When I scroll to new product tag
Then I see five new products
When I add first product to cart
Then I see alert add item to success
When I scroll to top page
Then I should see the My Cart
When I hover My Cart
Then I see item in cart
When I click on checkout button
Then I go to checkout page
