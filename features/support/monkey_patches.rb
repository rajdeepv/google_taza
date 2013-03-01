### pay no attention to this nothing to see here at all
module Taza
  class Browser
    def self.create_watir_webdriver(params)
      require 'watir-webdriver'
      browser = nil
      if ENV['BROWSER'] == 'grid_firefox'
        client = Selenium::WebDriver::Remote::Http::Default.new
        client.timeout = 180 # seconds – default is 60
        profile = Selenium::WebDriver::Firefox::Profile.new

        # prevent Firefox from attempting www.X.com whenever X cannot be found
        # disable "domain guessing" http://www-archive.mozilla.org/docs/end-user/domain-guessing.html
        # http://code.google.com/p/selenium/wiki/RubyBindings#Tweaking_Firefox_preferences
        profile['browser.fixup.alternate.enabled'] = false

        # prevents the "Firefox can't find the server at X" message
        # http://newsnorthwoods.blogspot.com/2010/07/firefox-fix-for-server-not-found-error.html
        profile['network.dns.disablePrefetch'] = true

        profile['network.http.connect.timeout'] = 120 # These are attempts to increase the timeout before failing to find a site
        profile['network.http.request.timeout'] = 120 #  NOTE: they don't appear to affect our failures.


        caps = Selenium::WebDriver::Remote::Capabilities.firefox(:firefox_profile => profile)
        driver = Selenium::WebDriver.for(:remote,
                                         :url => "http://localhost:4444/wd/hub",
                                         :desired_capabilities => caps,
                                         :http_client => client)
        #driver.manage.timeouts.page_load = 120
        browser = Watir::Browser.new driver
      else
        browser = Watir::Browser.new params[:browser]
      end
      browser
    end
  end
end
