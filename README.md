# DemoQA E-Commerce

A Test Framework for the DemoQA site ([http://store.demoqa.com/](http://store.demoqa.com/)).

## What's being Delivered?

### 24 User Journeys
###  18 User Stories
###  12 High Priority Journeys tested
### 19 Journeys written in Gherkin syntax
###  70 tests
###  Maintanable and reusable testing framework (POM)
###  Documentation for adding more tests
### Improved regression test time: 3 Minutes

## Requirements

The requirements were to test the following pages and features:

Priority Key : **High Priority (HP), Low Priority (LP)**

* Registration (HP)
* Signing in (LP)
* Lost Password (LP)
* Checkout and Basket (HP)
* Blog (HP)
* Product Category (HP)
	- Accessories
	- iMacs
	- iPads
	- iPhones
	- iPods
	- MacBooks
* Adding to cart (HP)
* Search (LP)
* Product Pages (HP)
	- Grid
	- List
	- FaceBook likes

Priority for testing was decided according to stakeholder's requirements.

### Behaviour Driven Development (BDD)
BDD was used to figure out the customer's requirements defined in automated acceptance tests. These are done so to ensure that it's readable and understood by everyone involved in the project (whether is the stakeholder or the developers).

## Quickstart
### Install

Clone this repo to your personal computer using the terminal:

```
https://github.com/spartaglobal/ToolQATestFramework.git

```
 Then once you are in the root folder, in your terminal enter:

```
bundle install - to install the test plugins
cucumber - to run tests

```
### Adding new tests

To create a test for a scenario, you create a new .feature file. Next, scenarios must be added inside the feature file. Finally, run cucumber on the terminal.

Example:

```Cucumber
Feature: Homepage
Scenario: If I submit a valid email and correctly follow the sequential steps then I should be successfully registered.

        Given I visit the homepage
        And I navigate to the register page
        When I submit a valid email and username
        Then Receive the confirmation message
```
### Implementing methods on the tests

Once you run cucumber, the terminal will generate a step definition that you can use to run your tests. Any auto-generated _"And"_ must be changed to an appropriate _"Given"_, _"When"_, or _"Then"_.

```
Given("I visit the homepage") do
  pending # Write code here that turns the phrase above into concrete actions
end

Given("I navigate to the register page") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I submit a valid email and username") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("Receive the confirmation message") do
  pending # Write code here that turns the phrase above into concrete actions
end
```
To successfully run a scenario, you can use the relevant method to ensure that you are testing the specific feature on the page. Thanks to the Page Object Model (POM), we are able to reuse the methods for different tests.

Below are the methods available to use: 

```
> demoqa_category.rb

> > > click_add_button

> > > check_url

> > > find_checkout_number

> > > find_category_name_and_product_name

> > > view_product_category_from_blog_post

> > > view_grid_view

> > > view_list_view

> > > grid_view

> > > list_view

> > > click_view_title

> > > check_item_in_list

> > > check_item_in_grid

> > > check_if_on_a_product_cat_page

> > > get_blog_post_title

> > > list_and_gird_items
```
```
> demoqa_checkout.rb

> > > check_checkout_error_message

> > > click_checkout_your_cart_continue_button

> > > click_checkout_info_purchase_button

> > > check_form_error_message

> > > select_product

> > > update_quantity

> > > save_update

> > > get_total_price_of_item

> > > get_price_of_item

> > > remove_item

> > > get_empty_basket_message

> > > item_list

> > > check_url

> > > get_item_name

> > > fill_in_email

> > > fill_in_first_name

> > > fill_in_last_name

> > > fill_in_address

> > > fill_in_city

> > > fill_in_county

> > > fill_in_country

> > > fill_in_post_code

> > > fill_in_phone

> > > fill_in_shipping

> > > checkout_confirmation

> > > check_if_on_cart_page
```
```
> demoqa_homepage.rb

> > > visit_homepage

> > > click_blog_post

> > > get_name_of_blog_post

> > > click_on_proudct_category

> > > click_on_my_account_button

> > > visit_checkout_cart

> > > click_on_all_products_button

> > > hover_product_categories

> > > select_random_category

> > > check_url
```
```
> demoqa_register.rb

> > > navigate_register_page

> > > fill_in_username

> > > fill_in_email

> > > click_register_button

> > > register_confirmation_message

> > > fill_in_password

> > > click_reset_password

> > > account_confirmation_message

> > > check_register_link
```

## Tests

### Examples
```
@test_checkout_form_empty
  Scenario: Testing the error messages in the purchase form # features/demoqa_checkout_form.feature:10
    Given I am on the demo home page                        # features/step_definitions/demoqa_checkout_form_step_defs.rb:1
    And I add an item to cart                               # features/step_definitions/demoqa_checkout_form_step_defs.rb:5
    When I submit the form                                  # features/step_definitions/demoqa_checkout_form_step_defs.rb:12
    And I got back to the checkout form                     # features/step_definitions/demoqa_checkout_form_step_defs.rb:22
    Then I should receive the correct error message         # features/step_definitions/demoqa_checkout_form_step_defs.rb:26

1 scenario (1 passed)
5 steps (5 passed)
0m32.132s
```

```
@product_view_grid
  Scenario: If I click on grid view on a product page the items should be displayed correctly in grid view. # features/demoqa_product_view.feature:4
    Given I am on the product category page                                                                 # features/step_definitions/demoqa_product_category_step_defs.rb:41
    And I am in the list view list                                                                          # features/step_definitions/demoqa_product_category_step_defs.rb:60
    When I select grid view                                                                                 # features/step_definitions/demoqa_product_category_step_defs.rb:50
    Then the product should be displayed in the grid view                                                   # features/step_definitions/demoqa_product_category_step_defs.rb:54

1 scenario (1 passed)
4 steps (4 passed)
0m12.031s

```
## User Journeys
These are the user journeys gathered from navigating the DemoQA website.

```
1)	Homepage – My Account – Register – Username – Email – Register
2)	Homepage – My Account – Register – Wrong Username – Right Email – Register – Error
3)	Homepage – My Account – Register – Wrong Username – Wrong Email – Register – Error
4)	Homepage – My Account – Register – Right Username – Wrong Email – Register - Error
5)	Homepage – Wrong Username/Email – Wrong Password – Login – Lost Password? – Username/email – Error message – Email Sent
6)	Homepage – More details – Blog Post
7)	Homepage – Product Category – Ipad, Iphone , MacBook – Rating
8)	Homepage – Product Category – Iphone – Select Item – Add to Cart – Confirm Message – Go to Cart – Check Item Is In Cart
9)	Homepage – All product – Grid
10)	Homepage – All products – product – Like – Redirect to FB
11)	Homepage – Product category – Iphone – Product – Like – Redirect to FB
12)	Homepage – My Account – Log in – Correct Username – Correct Password – Logged In
13)	Homepage – My Account – Log in – Invalid Username – Invalid Username message
14)	Homepage – My Account – Log in – Empty Username – Empty Username message
15)	Homepage – My Account – Log in – Correct Username – Invalid Password – Invalid Password Message
16)	Homepage – My Account – Log in – Correct Username – Empty Password – Empty Password Message
17)	Homepage – Search Bar – Match Product Name – Click product – Show Product
18)	Homepage – Search Bar – Match Product Name – Error Message
19)	Homepage – Basket With Items – Show – Update – Remove – Checkout – Click continue – Checkout Form – Valid Details – Purchase confirmation
20)	Homepage – Basket With Items – Show – Update – Remove – Checkout – Click continue – Checkout Form – Missing details – Error Message
21)	Homepage – Basket with Items – Show – Update – Remove – Checkout (While Logged in) – Account Details
22)	Homepage – Hover Product Category + Click on – Accessories (Imac, Ipod) – Add to Cart
23)	Homepage – Hover Product Category + Click on – Accessories (Imac, Ipod) – Display (List) – Rate/Like (Displayed)
24)	Homepage – Hover product category + Click on – Accessories (Imac, Ipod) – Click item – Item details – Add To The Cart
```
## Sprints

### Sprint 1 - 12:00 pm 24th April 2018 - 3:00 pm 26th April 2018
Tests written for the highest priority, i.e: user journey: purchase an item.
This included 8 user stories:

**(1)** As a User, I want to be able to successfully purchase the items in my basket.
```Cucumber
Given I am on the checkout page.
And I input the correct details.
When I submit the form.
Then I should receive the confirmation.
```
**(2)** As a User, I want to be able to select a product category so that I can view the items in that category.
```Cucumber
Given I select a product category.
When I click on a category.
Then I should get a list of items that match the category.
```
**(3)** As a User, I want to be able to view the items in my basket.
```Cucumber
Given I am on the Demo QA home page.
And I have items in my basket.
When I select the basket page.
Then I receive a list of items in the basket.
```
**(4)** As a User, I want to get the correct error message when the basket is empty.
```Cucumber
Given I am on the home page.
And There are no items in my basket.
When I click on the checkout.
Then  I should get the correct error message.
```
**(5)** As a User, I want to be able to view a blog post.
```Cucumber
Given I am on the home page.
When I click on a blog post.
Then I should view the correct blog post.
```
**(6)** As a User, I want to get the correct error message when I enter the wrong details in the checkout form.
```Cucumber
Given I am on the checkout page.
And I input no details.
When I submit the form.
And I got back to the checkout form.
Then I should receive the correct error message.
```
**(7)** As a User, I want to be able to add items to my basket.
```Cucumber
Given I on the product category page.
When When I click on Add item.
Then I should see the item count in the basket increment.
```
**(8)** As a User, I want to be able to show/update/remove items in my basket.
```Cucumber
Given I visit the homepage
And I have at least one item in my basket
When When I click on the product name on the checkout page
Then The blog page is displayed
```
```Cucumber
Given I am on the checkout page
And I have at least one item in my basket
When When I input a new quantity and I click on the update
Then the total price should be update
```
```Cucumber
Given I am on the checkout page
And I have  more than one item in my basket
When When I click remove
Then The item should be removed from the basket
```
```Cucumber
Given I am on the checkout page
And I have only one item in my basket
When When I click remove
Then I receive the correct error
```
### Sprint 2 - 09:00 am 27th April 2018 - 3:00 pm 30th April 2018
These are the user stories that have been worked on in the second sprint:

**(1)**  As a User, I want to successfully register so that I can have an account.
```Cucumber
Given I am on the homepage
And I navigate to the register page
When I submit a valid email and username
Then Receive the confirmation message
```
```Cucumber
Given I am on the email homepage
And Successfully logged in
When I click the confirmation email
Then I navigate to the password creating page
```
```Cucumber
Given I am on the password creating page
When I submit the valid password
Then My account should be successfully created
```

**(2)**  As a User, I want to be able to see the products in a grid or list view.
```Cucumber
Given I am on the product category page
And I am in the list view grid
When I select grid view
Then the product should be displayed in the grid view
```
```Cucumber
Given I am on the product category page
And I am in the list view list
When I select list view
Then the product should be displayed in the list view
```
**(3)**  As a User, I want to be able to successfully purchase the items in my basket.
```Cucumber
Given I am on the checkout page.
And I input the correct details.
When I submit the form.
Then I should receive the confirmation.
```
