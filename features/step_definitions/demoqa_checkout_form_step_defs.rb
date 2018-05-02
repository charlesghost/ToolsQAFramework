Then ("I should get the correct error message") do
    expect(demo_checkout.check_checkout_error_message).to eq demo_checkout.empty_basket_message_text
end

Given("I add an item to cart") do
    demo_homepage.hover_product_categories
    demo_homepage.select_random_category
    demo_category.click_add_button(0)
    wait_time(5)
end

When("I submit the checkout form") do
    demo_homepage.visit_checkout_cart
    wait_time(5)
    demo_checkout.click_checkout_your_cart_continue_button
    demo_checkout.click_checkout_info_purchase_button
end

When("I got back to the checkout form") do
    demo_checkout.click_checkout_your_cart_continue_button
end

Then("I should receive the correct error message") do
    expect(demo_checkout.check_form_error_message).to eq demo_checkout.checkout_error_list
end

Given("I am on the checkout page") do
    demo_homepage.visit_homepage
    demo_homepage.hover_product_categories
    demo_homepage.select_random_category
    demo_category.click_add_button(0)
    demo_homepage.visit_checkout_cart
    @wait_time = wait_time(10)
    @wait_time.until {
      page.has_css?("a.step2")
    }
    demo_checkout.click_checkout_your_cart_continue_button
end

Given("I input the correct details") do
    demo_checkout.fill_in_first_name(demo_checkout.first_name_sample)
    demo_checkout.fill_in_last_name(demo_checkout.last_name_sample)
    demo_checkout.fill_in_address(demo_checkout.address_sample)
    demo_checkout.fill_in_email(demo_checkout.email_sample)
    demo_checkout.fill_in_city(demo_checkout.city_sample)
    demo_checkout.fill_in_country(demo_checkout.country_sample_path)
    demo_checkout.fill_in_post_code(demo_checkout.post_code_sample)
    demo_checkout.fill_in_county(demo_checkout.county_sample)
    demo_checkout.fill_in_phone(demo_checkout.phone_number_sample)
    demo_checkout.fill_in_shipphing
end

When("I submit the form") do
    demo_checkout.click_checkout_info_purchase_button
end

Then("I should receive the confirmation") do
    expect(demo_checkout.checkout_confirmation).to eq demo_checkout.checkout_confirmation_text
end
