require 'rubygems'
require 'nokogiri'
require 'open-uri'

module Navigator

  FIRST_WEBPAGE = 'http://www.wegottickets.com/searchresults/adv'
  PAGINATE_WEB_LINK = 'http://www.wegottickets.com/searchresults/page/2/adv#paginate'

  def initialize()
  end

  def getPageCount(page)
    paginateDiv = page.css("div[id='paginate']")
    paginationLinksExceptCurrentPage = paginateDiv.css("a[class='pagination_link']")
    maxPaginationLink = paginationLinksExceptCurrentPage[paginationLinksExceptCurrentPage.length - 1]
    if (maxPaginationLink != nil)
      maxPage = Integer(maxPaginationLink.text)
    end
    maxPage
  end

  def goToWebpage(webpage)
    page = Nokogiri::HTML(open(webpage))
    page
  end
end
