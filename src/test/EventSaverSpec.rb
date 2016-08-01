require 'rspec'
require 'json'
require_relative '../../src/main/Navigator.rb'
require_relative '../../src/main/Parser.rb'
require_relative '../../src/main/event/EventSaver.rb'

include Navigator
include EVENTSAVER

describe 'EventSaver' do

  @parser

  before(:example) do
    test_web_page = File.read('webpages/firstSearchPage.html')
    testPage = Nokogiri::HTML(test_web_page)
    testPage
    allow_any_instance_of(Navigator).to receive(:goToWebpage).and_return(testPage)
    page = Navigator.goToWebpage('')
    @parser = Parser.new(page)
    @parser.getEvents
    @parser.parse
  end

  context 'saves events from first page' do
    it 'should save events' do
      EVENTSAVER.saveEvents(@parser.event_details_list)
      eventsFile = File.read('../../events.json')
      expect(eventsFile).not_to be_nil

      eventsJsonMap = JSON.parse(eventsFile)
      expect(eventsJsonMap[1]['70\'S & 80\'S DISCO AT THE RIVOLI BALLROOM']['artist']).to eq('DJ Kobayashi & aerialist cabaret by Kellie Sky')
    end
  end

  after(:example) do
    File.delete('../../events.json')
  end

end