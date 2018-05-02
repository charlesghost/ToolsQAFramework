Feature: DemoHomepage

	@test_home_url
	Scenario: Navigating to the home page

		Given I visit the DemoQA homepage
		Then I am on the DemoQA homepage

	@test_checkout_url
	Scenario: Navigating to the cart

		Given I visit the DemoQA homepage
		When I click on the checkout cart
		Then I am on the cart page
