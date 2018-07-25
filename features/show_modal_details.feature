Feature: Show Modal Details Cucumber
  User click on button (+)
  Modal product detail is show

Background: there are many products
  Given there are 5 products in the application

@javascript
Scenario: I click button show (+)
When I go to the list products
Then I should be see 5 new products
And I scroll to new product tag
Then I should be see 5 new products
And I click on product with ID#item-5
Then I should see popup of that product detail togged