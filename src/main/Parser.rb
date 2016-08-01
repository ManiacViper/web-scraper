require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'uri'
require_relative 'event/EventDetails'

class Parser

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
      @eventDivs.each { |eventDiv|
        name = eventDiv.css('h2').css("a[class='event_link']").text
        venueDiv = eventDiv.css("div[class='block diptych chatterbox-margin']")
                      .css("div[class='venue-details']")
        artistHeaderElement = venueDiv.css('h4')[2]
        if (artistHeaderElement != nil)
          artistText = artistHeaderElement.text
        else
          artistText = ''
        end
        cityAndVenueDiv = venueDiv.css('h4')[0]
        cityText = cityAndVenueDiv.text.scan(/.*:/).first
        if (cityText != nil)
          cityText = cityText.sub!(':', '')
        end
        venueText = cityAndVenueDiv.text.scan(/:.*/).first
        if (venueText != nil)
          venueText = venueText.sub!(': ', '')
        end
        dateText = venueDiv.css('h4')[1].text
        priceText = eventDiv.css("div[class='searchResultsPrice']").css('strong').text
        if (priceText != nil)
          priceText
        end
        event_details = EVENTDETAILS.new(name, artistText,cityText, venueText, dateText, priceText)
        @event_details_list << event_details
      }
    end
  end

end
