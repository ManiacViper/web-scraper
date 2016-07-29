require 'rspec'
require_relative '../../src/main/main.rb'
require_relative '../../src/main/navigator.rb'
require_relative '../../src/main/parser.rb'

include NAVIGATOR

describe 'Parser' do

  context 'parse a page' do
    it 'should get all events' do
      page = NAVIGATOR.goToWebpage(NAVIGATOR::FIRST_WEBPAGE)
      parser = PARSER.new(page)
      parser.getEvents
      events = parser.eventDivs
      expect(events.length).to eq(10)
    end

    it 'should parse and return list of event details' do
      page = NAVIGATOR.goToWebpage(NAVIGATOR::FIRST_WEBPAGE)
      parser = PARSER.new(page)
      parser.getEvents
      events = parser.eventDivs
      parser.parse
      expect(events.length).to eq(10)
      expect(parser.event_details_list.length).to eq(10)
      expect(parser.event_details_list[0].event_name).to eq('69')
    end
  end

end