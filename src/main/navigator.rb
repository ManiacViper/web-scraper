require 'rubygems'
require 'nokogiri'
require 'open-uri'

module NAVIGATOR

  WEBSITE = 'http://www.wegotickets.com/searchresults/all'

  def initialize()
  end

  def goToWebsite(website)
    page = Nokogiri::HTML(open(website))
    page
  end
end
