require_relative 'Navigator.rb'
require_relative 'Parser.rb'
require_relative 'event/EventDetails.rb'
require_relative 'event/EventSaver.rb'

include Navigator
include EventSaver

class MAIN

  def initialize
    page = Navigator.goToWebpage(Navigator::FIRST_WEBPAGE)
    @parser = Parser.new(page)
    @parser.getEvents
    @parser.parse
    EventSaver.saveEvents(@parser.event_details_list)
	puts 'Events saved'
  end

end

MAIN.new
