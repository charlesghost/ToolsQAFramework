When("I click on a product category") do
    @demo_homepage = demo_homepage
    @demo_homepage.hover_product_categories
    @demo_homepage.select_random_category
    @product_cat = @demo_homepage.selected_category
end

Then("I should get a list of items that match the category") do
    expect(demo_category.check_url.path).to include @product_cat.downcase
    expect(demo_category.check_if_on_a_product_cat_page).to eq @product_cat
end

Given("I am on the product category page") do
    demo_homepage.visit_homepage
    demo_homepage.hover_product_categories
    demo_homepage.select_random_category
end

When("I click on Add item") do
    demo_category.click_add_button(0)
end

Then("I should see the item count in the basket increment") do
    @wait_time = wait_time(10)
    @wait_time.until{
      demo_category.find_checkout_number > 0
    }
    expect(demo_category.find_checkout_number).to be > 0
end

When("I click on a blog post") do
    @post = demo_homepage.get_name_of_blog_post(2)
    demo_homepage.click_blog_post(2)
  end

Then("I should view the correct blog post") do
    expect(demo_category.get_blog_post_title[0..16]).to eq @post[0..16]
end

Given('I am in the list view list') do
  @category_list = demo_category
  @category_list.view_list_view
  @view_items_list = @category_list.list_and_grid_items
end

When('I select grid view') do
    demo_category.grid_view
end

Then('the product should be displayed in the grid view') do
    demo_category.view_grid_view
    expect(demo_category.check_view_title).to eq @product_cat
    expect(demo_category.check_item_in_grid).to eq '132px'
    expect(demo_category.list_and_grid_items).to eq @view_items_list
end

Given('I am in the grid view list') do
    @category_grid = demo_category
    @category_grid.view_list_view
    @view_items_grid = @category_grid.list_and_grid_items
end

When('I select list view') do
    demo_category.list_view
end

Then('the product should be displayed in the list view') do
    demo_category.view_list_view
    expect(demo_category.check_view_title).to eq @product_cat
    expect(demo_category.check_item_in_list).to eq '660px'
    expect(demo_category.list_and_grid_items).to eq @view_items_grid
end
