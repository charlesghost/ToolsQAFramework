Given("I have an item in my basket") do
	demo_homepage.hover_product_categories
	demo_homepage.select_random_category
	@demo_category = demo_category
	@demo_category.click_add_button(0)
	@wait_time = wait_time(10)
    @wait_time.until{
      demo_category.find_checkout_number > 0
    }
end

Then("I receive a list of items in the basket") do
	expect(demo_checkout.item_list).to eq @demo_category.selected_items
	expect(demo_checkout.item_list.length).to be >= 1
end

When("I click on the product name on the checkout page") do
	@item_name = demo_checkout.get_item_name(0)
	demo_checkout.select_product(0)
end

Then("The blog page is displayed") do
	expect(demo_checkout.check_url.path).to include @item_name
	expect(demo_category.get_blog_post_title.downcase).to eq @item_name.gsub('-', ' ')
end

When("I input a new quantity") do
  	@checkout = demo_checkout
  	@checkout.update_quantity(0, 3)
  	@quantity = @checkout.quantity
end

When("I click on the update") do
  	demo_checkout.save_update(0)
end

Then("The total price should be updated") do
  	total = demo_checkout.get_total_price_of_item(0)
  	price = demo_checkout.get_price_of_item(0)
  	quantity = total/price
  	expect(quantity).to eq @quantity
end

When("I click remove") do
	@list_length = demo_checkout.item_list.length
	@wait_time.until{
		page.has_css?('td.wpsc_product_remove_0')
	}
	demo_checkout.remove_item(0)
end

Then("I should get the correct error message on the checkout page") do
	expect(demo_checkout.get_empty_basket_message).to eq demo_checkout.empty_basket_message_text
end

Given("I have more than one item in my basket") do
	demo_homepage.hover_product_categories
	demo_homepage.select_random_category
	demo_category.click_add_button(0)
	demo_category.click_add_button(1)
	@wait_time = wait_time(10)
    @wait_time.until{
      demo_category.find_checkout_number > 1
    }
end

Then("The item should be removed from the basket") do
	expect(demo_checkout.item_list.length).to eq (@list_length - 1)
end