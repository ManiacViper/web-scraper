require 'rubygems'
require 'nokogiri'
require 'open-uri'

module PARSER

  def initialize()
  end

  def getEvents(page)
    eventDivs = page.css("div[class='content block-group chatterbox-margin']")
    eventDivs
  end

end
