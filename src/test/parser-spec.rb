require 'rspec'
require_relative '../../src/main/main.rb'
require_relative '../../src/main/navigator.rb'
require_relative '../../src/main/parser.rb'

include NAVIGATOR
include PARSER

describe 'Parser' do

  context 'parse a page' do
    it 'should get all events' do
      page = NAVIGATOR.goToWebpage(NAVIGATOR::FIRST_WEBPAGE)
      events = PARSER.getEvents(page)
      expect(events.length).to eq(10)
    end
  end

end