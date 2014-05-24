require 'rubygems'
require 'taza/page'

module Google
  class SearchResultsPage < ::Taza::Page
    element(:search_results) {browser.ol(:id=>"rso").when_present.lis(:class=>"g")}


    def all_results_has? search_text
      search_results.each do |search_result|
        puts "##"+search_result.a.text
        return false unless search_result.a.text.downcase.include?(search_text.downcase)
      end
      true
    end

  end
end
