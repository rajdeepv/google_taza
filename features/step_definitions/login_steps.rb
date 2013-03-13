When /^I login with incorrect credentials$/ do
  @google.sign_in("mail.rajvarma", "password")
end
Then /^I should see an error message$/ do
  @google.sign_in_page.error_message.text.should eq "The username or password you entered is incorrect. ?"
end
