require 'rspec'
require_relative '../../src/main/main.rb'
require_relative '../../src/main/navigator.rb'

include NAVIGATOR

describe 'My behaviour' do

  it 'should do something' do
    page = NAVIGATOR.goToWebsite(MAIN.new::WEBSITE)
    expect(page).to be_empty
  end
end