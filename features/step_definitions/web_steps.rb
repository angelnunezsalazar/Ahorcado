Given /^I open the web app$/ do
  visit '/'
end

When /^I click on "(.*)"$/ do |text|
  click_link(text)
end

Then /^I should see "(.*)"$/ do |text|
  last_response.body.should =~ /#{text}/m
end

When /^I fill "(.*)" with "(.*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I press "(.*)"$/ do |name|
  click_button(name)
end

Given /^Im playing with "([^"]*)"$/ do |palabra_secreta|
  visit '/'
  fill_in("palabra_secreta", :with => palabra_secreta)
  click_button("OK")
end

Given /^I try with letters "([^"]*)"$/ do |list_of_letters|
  letters=list_of_letters.split(',')
  letters.each{|letter|
  	fill_in("letra", :with => letter)
  	click_button("OK")
  }
end

