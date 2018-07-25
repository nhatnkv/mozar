Feature: Check Out
  If user click to checkout button when cart is empty
  the site auto redirect to home page

Background: there are many products
  Given there are 5 products in the application
  
@javascript
Scenario: Return root page when cart hasnt item
When I go to the homepage
Then I should be see the My Cart
When I hover My Cart
Then I shouldnt be see any item in cart and checkout button
When I click on checkout button
Then I should be redirected to homepage


@javascript
Scenario: Go to checkout page when cart has item
When I go to the homepage
Then I should be see the My Cart
When I scroll to new product tag
Then I should be see 5 new products
When I add first product to cart
Then I should be see alert add item to success
When I scroll to top page
Then I should be see the My Cart
When I hover My Cart
Then I should be see item in cart
When I click on checkout button
Then I should be go to checkout page
