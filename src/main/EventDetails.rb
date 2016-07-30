require 'rubygems'
require 'nokogiri'
require 'open-uri'

class EVENTDETAILS

  attr_accessor :event_name
  @event_name

  attr_accessor :artist
  @artist

  attr_accessor :city
  @city

  attr_accessor :venue
  @venue

  attr_accessor :date
  @date

  attr_accessor :price
  @price

  def initialize(event_name, artist, city, venue, date, price)
    @event_name = event_name
    @artist = artist
    @city = city
    @venue = venue
    @date = date
    @price = price
  end

end
