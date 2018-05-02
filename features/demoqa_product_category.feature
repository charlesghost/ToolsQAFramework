Feature: Category Add item

    @test_category_select
    Scenario: If I select the product category I should be able to see the list of items from that category

        Given I visit the DemoQA homepage
        When I click on a product category
        Then I should get a list of items that match the category

    @test_add_into_basket
    Scenario: If I add items to the basket then the basket counter should increment by one and the item should be in the basket

        Given I am on the product category page
        When I click on Add item
        Then I should see the item count in the basket increment

    @test_blog_post
    Scenario: If I am on the home page and I select an item it should show the correct blog post

	   Given I visit the DemoQA homepage
	   When I click on a blog post
	   Then I should view the correct blog post

    @test_product_view_grid
    Scenario: If I click on grid view on a product page the items should be displayed correctly in grid view

        Given I visit the DemoQA homepage
        And I click on a product category
        And I am in the list view list
        When I select grid view
        Then the product should be displayed in the grid view

    @test_product_view_list
    Scenario: If I click on list view on a product page the items should be displayed correctly in list view

        Given I visit the DemoQA homepage
        And I click on a product category
        And I am in the grid view list
        When I select list view
        Then the product should be displayed in the list view
