require 'rubygems'

module Google
  class Google < ::Taza::Site
    def sign_in email, password
      home_page.sign_in_button.click
      sign_in_page.email_box.send_keys email
      sign_in_page.password_box.send_keys password
      sign_in_page.sign_in_button.click
    end
  end
end
