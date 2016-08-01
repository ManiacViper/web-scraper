require 'rubygems'
require 'nokogiri'
require 'open-uri'

class EVENTDETAILS

  attr_accessor :name
  @name

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

  def initialize(name, artist, city, venue, date, price)
    @name = name
    @artist = artist
    @city = city
    @venue = venue
    @date = date
    @price = price
  end

end
