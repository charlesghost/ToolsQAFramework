require 'capybara/dsl'

class DemoQaCheckout
	include Capybara::DSL

	attr_accessor :quantity, :checkout_error_list, :empty_basket_message, :checkout_progress_info, :checkout_progress_final, :error_field_message, :email_field, :first_name_field, :last_name_field, :address_field, :city_field, :county_field, :country_dropdown, :postal_code, :phone_field, :shipping_address, :checkout_confirmation, :empty_basket_message_text, :checkout_confirmation_text, :first_name_sample, :last_name_sample, :address_sample, :email_sample, :city_sample, :country_sample_path, :post_code_sample, :county_sample, :phone_number_sample

	def initialize
		@checkout_error_list = ["Please enter a valid email.", "Please enter a valid first name.", "Please enter a valid last name.", "Please enter a valid address.", "Please enter a valid city.", "Please enter a valid country.", "Please enter a valid phone."]
		@empty_basket_message = "div.entry-content"
		@empty_basket_message_text = 'Oops, there is nothing in your cart.'
		@checkout_progress_info = 'Continue'
		@checkout_progress_final = 'Purchase'
		@error_field_message = 'wpsc_error_msg_field_name'
		@email_field = 'wpsc_checkout_form_9'
		@first_name_field = 'wpsc_checkout_form_2'
		@last_name_field = 'wpsc_checkout_form_3'
		@address_field = 'wpsc_checkout_form_4'
		@city_field = 'wpsc_checkout_form_5'
		@county_field = 'wpsc_checkout_form_6'
		@country_dropdown = 'wpsc_checkout_form_7'
		@postal_code = 'wpsc_checkout_form_8'
		@phone_field = 'wpsc_checkout_form_18'
		@first_name_sample = 'jose'
		@last_name_sample = 'david'
		@address_sample = '32 opulta'
		@email_sample = 'joe@sparta.com'
		@city_sample = 'london'
		@country_sample_path = 'option[2]'
		@post_code_sample = 'en5 23h'
		@county_sample = 'hereford'
		@phone_number_sample = '07942424525'
		@shipping_address = 'shippingSameBilling'
		@checkout_confirmation = 'content_container'
		@checkout_confirmation_text = 'Thank you, your purchase is pending. You will be sent an email once the order clears.'
	end

	def check_checkout_error_message
    	find(:css, @empty_basket_message).text
  	end

	def click_checkout_your_cart_continue_button
		find('span', text: @checkout_progress_info).click
	end

	def click_checkout_info_purchase_button
		click_button(@checkout_progress_final)
	end

	def check_form_error_message
		errors = []
		page.all(:css, "p.validation-error").each do |error|
			errors << error.text
		end
		errors
	end

	def select_product(index_of_item)
		class_of_item = "wpsc_product_name_#{index_of_item}"
		within(:css, "td.#{class_of_item}") do
			find('a').click
		end
	end

	def update_quantity(index_of_item, new_quantity)
		@quantity = new_quantity
		selected_item = "wpsc_product_quantity_#{index_of_item}"

		within(:css, "td.#{selected_item}") do
			find(:css, "input[name$='quantity']").set(new_quantity)
		end
	end

	def save_update(index_of_item)
		selected_item = "wpsc_product_quantity_#{index_of_item}"
		within(:css, "td.#{selected_item}") do
			find("input[type='submit']").click
		end
	end

	def get_total_price_of_item(index_of_item)
		selected_item = "product_row_#{index_of_item}"
		within(:css, "tr.#{selected_item}") do
			within(:css, "td.wpsc_product_price_#{index_of_item}") do
				@total = find(:css, "span.pricedisplay").text
			end
		end
		@total.gsub!('$', '').to_f
	end

	def get_price_of_item(index_of_item)
		selected_item = "product_row_#{index_of_item}"
		within(:css, "tr.#{selected_item}") do
			@price = find(:css, "span.pricedisplay").text
		end
		@price.gsub!('$', '').to_f
	end

	def remove_item(index_of_item)
		selected_item = "wpsc_product_remove_#{index_of_item}"
		within(:css, "td.#{selected_item}") do
			find("input[type='submit']").click
		end
	end

	def get_empty_basket_message
		find(:css, @empty_basket_message).text
	end

	def item_list
		array = []
		page.all(:css, "td.wpsc_product_name").each do |item|
			within(item) do
				array << find('a').text
			end
		end
		array
	end

	def check_url
		URI.parse(current_url)
	end

	def get_item_name(index_of_item)
		selected_item = "wpsc_product_name_#{index_of_item}"
		within(:css, "td.#{selected_item}") do
			@item_name = find('a').text
		end
		@item_name.downcase!.gsub!(' ', '-')
	end

	def fill_in_email(email_address)
		fill_in(@email_field, with: email_address)
	end

	def fill_in_first_name(firstname)
		fill_in(@first_name_field, with: firstname)
	end

	def fill_in_last_name(lastname)
		fill_in(@last_name_field, with: lastname)
	end

	def fill_in_address(address)
		fill_in(@address_field, with: address)
	end

	def fill_in_city(city)
		fill_in(@city_field, with: city)
	end

	def fill_in_county(county)
		fill_in(@county_field, with: county)
	end

	def fill_in_country(value)
		find(:id, @country_dropdown).find(:xpath, value).click
	end

	def fill_in_post_code(post_code)
		fill_in(@postal_code, with: post_code)
	end

	def fill_in_phone(phone)
		fill_in(@phone_field, with: phone)
	end

	def fill_in_shipphing
		check(@shipping_address)
	end

	def checkout_confirmation
		find_by_id(@checkout_confirmation)
		within(:css, 'div.wpsc-transaction-results-wrap') do
			find('p').text
		end
	end

	def check_if_on_cart_page
        find('h1', text: @checkout).text
    end
end
