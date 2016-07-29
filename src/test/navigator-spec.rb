require 'rspec'
require_relative '../../src/main/main.rb'
require_relative '../../src/main/navigator.rb'

include NAVIGATOR

describe 'Navigator' do

  context "navigation for one page" do
    it 'should go to web page' do
      page = NAVIGATOR.goToWebpage(NAVIGATOR::FIRST_WEBPAGE)
      expect(page.css("title").text).to eq('WeGotTickets | Simple, honest ticketing')
    end

    it 'should get the last page number in the pagination search results' do
      page = NAVIGATOR.goToWebpage(NAVIGATOR::FIRST_WEBPAGE)
      pageCount = NAVIGATOR.getPageCount(page)
      expect(pageCount).to eq(736) # not the best test as the max page can change
    end
    
  end

end