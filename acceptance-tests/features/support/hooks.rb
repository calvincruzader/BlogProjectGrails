require 'watir-webdriver'
require 'byebug'
require 'page-object'

include PageObject::PageFactory

Before do
  @browser = Watir::Browser.new :firefox
end

After do
  @browser.close
end
