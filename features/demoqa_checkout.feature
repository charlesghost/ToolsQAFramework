Feature: Checkout
	
	@test_checkout_basket_view
	Scenario: If I click on my basket I should be able to view my items

		Given I visit the DemoQA homepage
		And I have an item in my basket
		When I click on the checkout cart
		Then I receive a list of items in the basket

	@test_checkout_to_blog
	Scenario: If I select a product in the checkout page it should show it's blog page

		Given I visit the DemoQA homepage
		And I have an item in my basket
		And I click on the checkout cart
		When I click on the product name on the checkout page
		Then The blog page is displayed

	@test_item_quantity_update
	Scenario: I should be able to update the quantity of the product on the checkout page

		Given I visit the DemoQA homepage
		And I have an item in my basket
		And I click on the checkout cart
		When I input a new quantity
		And I click on the update
		Then The total price should be updated

	@test_checkout_item_removable
	Scenario: If I remove an item from the checkout page it should update accordingly

		Given I visit the DemoQA homepage
		And I have an item in my basket
		And I click on the checkout cart
		When I click remove
		Then I should get the correct error message on the checkout page

	@test_checkout_multi_item_removable
	Scenario: If I remove multiple item from the checkout page it should update accordingly

		Given I visit the DemoQA homepage
		And I have more than one item in my basket
		And I click on the checkout cart
		When I click remove
		Then The item should be removed from the basket
