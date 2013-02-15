Given /^Iam on google home page$/ do
  @google = Google.new
end
When /^I search$/ do
  @google.home_page.search("TAZA")
end
Then /^I should see all results revelent to my search$/ do
  @google.search_results_page.all_results_has?("TAZA").should be_true
end