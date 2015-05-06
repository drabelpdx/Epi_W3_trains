require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exception, false)

describe('the Train path', {:type => :feature}) do
  it('it creates a list of trains') do
    visit('/trains_form')
    fill_in('name', :with => 'Red Line')
    click_button('Add Train')
    expect(page).to have_content('Red Line')
  end
end
