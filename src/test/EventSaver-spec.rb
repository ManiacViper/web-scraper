require 'rspec'
require 'json'
require_relative '../../src/main/main.rb'
require_relative '../../src/main/navigator.rb'
require_relative '../../src/main/parser.rb'
require_relative '../../src/main/EventSaver.rb'

include NAVIGATOR
include EVENTSAVER

describe 'File Creator' do

  context 'saves events from first page' do
    it 'should save events' do
      File.delete('../../events.json')

      page = NAVIGATOR.goToWebpage(NAVIGATOR::FIRST_WEBPAGE)
      parser = PARSER.new(page)
      parser.getEvents
      parser.parse

      EVENTSAVER.saveEvents(parser.event_details_list)
      eventsFile = File.read('../../events.json')
      expect(eventsFile).not_to be_nil

      eventsJsonMap = JSON.parse(eventsFile)
      expect(eventsJsonMap[0]['69']['artist']).to eq('testing')
    end

  end

end