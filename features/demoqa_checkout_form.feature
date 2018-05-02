Feature: CheckoutFormError

	@test_checkout_empty
	Scenario: Testing the error message in an empty cart

		Given I visit the DemoQA homepage
		When I click on the checkout cart
		Then I should get the correct error message

	@test_checkout_form_empty
	Scenario: Testing the error messages in the purchase form

		Given I visit the DemoQA homepage
		And I add an item to cart
		When I submit the checkout form
		And I got back to the checkout form
		Then I should receive the correct error message

	@test_checkout_form_success
  	Scenario: If I input the correct details in the checkout form I would get a confirmation message on a new page

		Given I am on the checkout page
		And I input the correct details
		When I submit the form
		Then I should receive the confirmation
