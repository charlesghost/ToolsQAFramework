require_relative 'pages/demoqa_homepage'
require_relative 'pages/demoqa_checkout'
require_relative 'pages/demoqa_category'
require_relative 'pages/demoqa_register'

module DemoSite

	def demo_homepage
		DemoQaHomepage.new
	end

	def demo_checkout
		DemoQaCheckout.new
	end

	def demo_category
		DemoQaCategory.new
	end

	def demo_register
		DemoQaRegister.new
	end

	def wait_time num
		Selenium::WebDriver::Wait.new(timeout: num)
	end
end
