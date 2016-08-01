require 'rspec'
require_relative '../../src/main/Navigator.rb'

include Navigator

describe 'Navigator' do

  context 'navigation for one page' do
    it 'should go to web page' do
      page = Navigator.goToWebpage(Navigator::FIRST_WEBPAGE)
      expect(page.css("title").text).to eq('WeGotTickets | Simple, honest ticketing')
    end

    it 'should get the last page number in the pagination search results' do
      test_web_page = File.read('webpages/firstSearchPage.html')
      testPage = Nokogiri::HTML(test_web_page)
      testPage
      allow_any_instance_of(Navigator).to receive(:goToWebpage).and_return(testPage)
      page = Navigator.goToWebpage(Navigator::FIRST_WEBPAGE)
      pageCount = Navigator.getPageCount(page)
      expect(pageCount).to eq(723)
    end
    
  end

end