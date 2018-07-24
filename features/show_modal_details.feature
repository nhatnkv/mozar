Feature: Show Modal Details Cucumber
  Show modal

Background: there are many products
  Given there are five products in the application

@javascript
Scenario: I click button show (+)
When I go to the list products
Then I can see the product list
And I scroll to new product tag
Then I see five new products
And I click on product with ID#item-5
Then I should see popup of that product detail togged