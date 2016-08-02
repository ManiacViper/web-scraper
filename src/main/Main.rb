require_relative 'Navigator.rb'
require_relative 'Parser.rb'
require_relative 'event/EventDetails.rb'
require_relative 'event/EventSaver.rb'

include Navigator
include EventSaver

# cant test this on the command line as there is a version compatibility error for
# ruby 2.3.1 and nokogiri gem

class MAIN

  def initialize
    page = Navigator.goToWebpage(Navigator::FIRST_WEBPAGE)
    @parser = Parser.new(page)
    @parser.getEvents
    @parser.parse
    EventSaver.saveEvents(@parser.event_details_list)
  end

end