Given(/^I visit the site$/) do
  visit 'http://localhost:3000/'
end

When (/^I click on the (.*) menu$/) do |link|
  click_link("#{link}-menu")
end

Then(/^the (.*) modal should be visible$/) do |modal|
  expect(page).to have_selector(".modal-#{modal}", visible: true)
end
