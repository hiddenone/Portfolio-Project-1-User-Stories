require 'spec_helper'
require 'pp'
require 'ruby-debug'

Capybara.configure do |config| 
  config.match = :one
  config.exact_options = true
  config.ignore_hidden_elements = true
  config.visible_text_only = true
end
#pry
#  the puts strings appears at the top of the test results
puts "smoke_tests_spec-DEBUG:Capybara.default_selector=#{Capybara.default_selector}"
# this is NOT the way to change the default selector
#   but it might be a way to have Capybara search via id
#Capybara.default_selector = id
#puts Capybara.default_selector

#Launchy.open("www.google.com")
describe "SearchTests" do
	it "finds all notes"
	it "finds notes with search Term 'test'"
end # end of SearchTests
