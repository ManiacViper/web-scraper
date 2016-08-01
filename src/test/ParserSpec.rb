require 'rspec'
require_relative '../../src/main/Navigator.rb'
require_relative '../../src/main/Parser.rb'

include Navigator

describe 'Parser' do

  @parser

  before(:example) do
    test_web_page = File.read('webpages/firstSearchPage.html')
    testPage = Nokogiri::HTML(test_web_page)
    testPage
    allow_any_instance_of(Navigator).to receive(:goToWebpage).and_return(testPage)
    page = Navigator.goToWebpage('')
    @parser = Parser.new(page)
  end

  context 'parse a page' do
    it 'should get all events' do
      @parser.getEvents
      events = @parser.eventDivs
      expect(events.length).to eq(10)
    end

    it 'should parse and return list of event details' do
      @parser.getEvents
      events = @parser.eventDivs
      @parser.parse
      expect(events.length).to eq(10)
      expect(@parser.event_details_list.length).to eq(10)
    end

    it 'should parse and return correct event details (except artist)' do
      @parser.getEvents
      @parser.parse
      firstEvent = @parser.event_details_list[0]
      expect(firstEvent.name).to eq('69')
      expect(firstEvent.city).to eq('KEIGHLEY')
      expect(firstEvent.venue).to eq('Exchange Arts Centre')
      expect(firstEvent.date).to eq('Sat 30th Jul, 2016, 7:30am')
      # expect(firstEvent.price).to eq('\\xA38.80')
    end

    it 'should parse and return correct event artist' do
      @parser.getEvents
      @parser.parse
      secondEvent = @parser.event_details_list[1]
      expect(secondEvent.artist).to eq('DJ Kobayashi & aerialist cabaret by Kellie Sky')
    end
  end

end