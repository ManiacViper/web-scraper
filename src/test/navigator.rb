require 'test/unit'
require_relative '../../src/main/main.rb'
require_relative '../../src/main/navigator.rb'

include NAVIGATOR

class MyTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test
  def shouldReturnHtmlFromWebsite
    page = NAVIGATOR.goToWebsite(MAIN.new::WEBSITE)
    assert(page != nil, 'does not go to the website specified')
  end
end