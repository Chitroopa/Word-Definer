require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('contact',{:type => :feature}) do
  it('on click of list of words display definition page') do
    visit('/')
    click_on('Apple')
    expect(page).to have_content('Apple')
  end

  it('on click Add word button show word addition page') do
    visit('/')
    click_button('Add word')
    expect(page).to have_content('Add word and its defintion:')
  end

  it('process user entry and show word list') do
    visit('/word/new')
    fill_in('new-word', :with => "Bannana")
    fill_in('img-url', :with => "http://learnenglishkids.britishcouncil.org/sites/kids/files/RS1874_Banana%20col-web.jpg")
    fill_in('meaning', :with => "A fruit that is shaped somewhat like a finger, is usually yellow when ripe, and grows in bunches on a large treelike tropical plant with very large leaves.")
    click_button('Save')
    expect(page).to have_content('Bannana')
  end

  it('process search request and show the result') do
    visit('/')
    fill_in('search', :with => "Sun")
    click_button('Go!')
    expect(page).to have_content('Sun')
  end

  it('show all words with definition') do
    visit('/')
    click_button('See all words with definition')
    expect(page).to have_content('Sun')
    expect(page).to have_content('The star that the Earth moves around and that gives the Earth heat and light.')
  end

  it('process add another defintion request and show the result') do
    visit('/word/1')
    fill_in('meaning', :with => "The droplets are so small and light that they can float in the air.")
    click_button('Add definition')
    expect(page).to have_content('The droplets are so small and light that they can float in the air.')
  end
end
