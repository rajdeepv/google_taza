require 'rubygems'
require 'taza/page'

module Google
  class SearchResultsPage < ::Taza::Page
    element(:search_results) {browser.lis(:class=>"g")}


    def all_results_has? search_text
      search_results.each do |search_result|
        return false unless search_result.a.text.include?(search_text)
      end
      true
    end

  end
end
