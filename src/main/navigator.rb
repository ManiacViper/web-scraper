require 'rubygems'
require 'nokogiri'
require 'open-uri'

module NAVIGATOR

  FIRST_WEBPAGE = 'http://www.wegottickets.com/searchresults/adv'
  PAGINATE_WEB_LINK = 'http://www.wegottickets.com/searchresults/page/2/adv#paginate'

  def initialize()
  end

  def getPageCount(page)
    allPaginationLinks = page.css("a[class='pagination_link']")
    pageCount = allPaginationLinks[allPaginationLinks.length]
    pageCount
  end

  def goToWebpage(webpage)
    page = Nokogiri::HTML(open(webpage))
    page
  end
end
