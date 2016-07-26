require 'rubygems'
require 'nokogiri'
require 'open-uri'

module NAVIGATOR

  def initialize()
  end

  def goToWebsite(website)
    page = Nokogiri::HTML(open(website))
  end
end
