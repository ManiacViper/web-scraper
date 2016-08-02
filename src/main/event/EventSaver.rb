require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'

module EventSaver

  def initialize()
  end

  def saveEvents(event_details_list)
    temp_map_list = Array.new
    tempMap = Hash.new
    event_details_list.each { |event_details|
      tempMap = {
          event_details.name => {
              :artist => event_details.artist,
              :city => event_details.city,
              :venue => event_details.venue,
              :date => event_details.date
              # :price => event_details.price
          }
      }
      temp_map_list << tempMap
    }
    if (temp_map_list != nil and temp_map_list.length > 0)
      File.open('../../events.json','w') do |file|
        file.write(temp_map_list.to_json)
      end
    else
      throw new RuntimeError('event_details_list does not have events')
    end
  end

end
