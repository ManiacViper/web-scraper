require 'rspec'
require_relative '../../src/main/main.rb'
require_relative '../../src/main/navigator.rb'

include NAVIGATOR

describe 'My behaviour' do

  it 'should do something' do
    page = NAVIGATOR.goToWebsite(NAVIGATOR::WEBSITE)
    expect(page).not_to be_nil
  end
end