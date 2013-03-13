require 'rubygems'
require 'taza/page'

module Google
  class SignInPage < ::Taza::Page
    element(:email_box) {browser.input(:id=>"Email")}
    element(:password_box) {browser.input(:id=>"Passwd")}
    element(:sign_in_button) {browser.input(:id=>"signIn")}
    element(:error_message) {browser.span(:id=>"errormsg_0_Passwd")}

  end
end
