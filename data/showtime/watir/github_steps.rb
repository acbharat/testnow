Given /^I am on github page$/ do
  ENV['TEST_URL'] = "https://github.com" if ENV['TEST_URL'].nil?
  @browser.goto(ENV['TEST_URL'])
end

When (/^I search for "([^"]*)" keyword$/) do |key|
  home = GithubPage.new(@browser)
  home.search_github(key)
end

When /^I follow the Users Tab$/ do
  home = GithubPage.new(@browser)
  home.click_tab("Users")
end

When /^I follow username link to view the profile page$/ do
  home = GithubPage.new(@browser)
  home.visit_profile
end

Then (/^I verify "([^"]*)" is displayed$/) do |name|
  home = GithubPage.new(@browser)
  home.verify_text_presence(name)
end