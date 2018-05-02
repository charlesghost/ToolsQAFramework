require 'capybara/dsl'

class DemoQaCategory
    include Capybara::DSL

    attr_accessor :blog_product_id, :list_view_id, :grid_view_id, :grid_button_id, :list_button_id, :selected_items

    def initialize
        @blog_product_id = 'single_product_page_container'
        @list_view_id = 'default_products_page_container'
        @grid_view_id = 'grid_view_products_page_container'
        @grid_button_id = 'Grid View'
        @list_button_id = 'Default View'
        @selected_items = []
    end

    def click_add_button(index_of_item)
        @selected_items << page.all(:css, "a.wpsc_product_title")[index_of_item].text
        page.all(:css, "input[name$=Buy]")[index_of_item].click
    end

    def check_url
		URI.parse(current_url)
	  end

    def find_checkout_number
        within(:id, "header_cart") do
            find(:css, "em").text.to_i
        end
    end

    def find_category_name_and_product_name
        within(:css, "h2.prodtitle") do
            find(:css, "a").text
        end
    end

    def view_product_category_from_blog_post
        find_by_id(@blog_product_id)
    end

    def view_grid_view
        find_by_id(@grid_view_id)
    end

    def view_list_view
        find_by_id(@list_view_id)
    end

    def grid_view
        click_on(@grid_button_id)
    end

    def list_view
        click_on(@list_button_id)
    end

    def check_view_title
        within(:css, "header.page-header") do
            find(:css, "h1").text
        end
    end

    def check_item_in_list
        within(:css, "div#default_products_page_container") do
            find(:css, "div.default_product_display").native.css_value('width')
        end
    end

    def check_item_in_grid
        within(:css, "div#grid_view_products_page_container") do
            within(:css, "div.product_grid_display") do
                find(:css, "div").native.css_value('width')
            end
        end
    end

    def check_if_on_a_product_cat_page
        find(:css, "h1.entry-title").text
    end

    def get_blog_post_title
        find(:css, "h1.prodtitle").text
    end

    def list_and_grid_items
      array = []
      page.all(:css, "h2.prodtitle").each do |item|
        array << item.text
      end
      array
    end
end
