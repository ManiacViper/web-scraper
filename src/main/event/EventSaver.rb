require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'

module EVENTSAVER

  def initialize()
  end

  def saveEvents(event_details_list)
    temp_map_list = Array.new
    event_details_list.each { |event_details|
      tempMap = {
          event_details.event_name => {
              'artist' => 'testing'
          }
      }
      temp_map_list << tempMap
    }
    if (temp_map_list != nil)
      File.open("../../events.json","w") do |file|
        file.write(temp_map_list.to_json)
      end
    else
      throw new RuntimeError('event_details_list does not have events')
    end
  end

end
