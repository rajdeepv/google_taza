require 'rubygems'
require 'taza/page'

module Google
  class HomePage < ::Taza::Page
    element(:search_textbox) {browser.input(:name => "q")}
    element(:search_button) {browser.button(:name => "btnG")}
    element(:sign_in_button) {browser.span(:class=> "gbit")}

    def search search_query
      search_textbox.send_keys search_query
      search_button.click
    end


  end
end
