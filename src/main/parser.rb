require 'rubygems'
require 'nokogiri'
require 'open-uri'
require_relative 'eventDetails'

class PARSER

  attr_accessor :eventDivs
  @eventDivs

  attr_accessor :page
  @page

  attr_accessor :event_details_list
  @event_details_list

  def initialize(page)
    @page = page
    @event_details_list = Array.new
  end

  def getEvents()
    @eventDivs = page.css("div[class='content block-group chatterbox-margin']")
  end

  def parse()
    if @eventDivs != nil and @eventDivs.length > 0
      events = @eventDivs.css('h2').css("a[class='event_link']")
      events.each { |event|
        event_details = EVENTDETAILS.new(event.text, '','','','','')
        @event_details_list << event_details
      }
    end
  end

end
