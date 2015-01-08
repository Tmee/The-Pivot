require "rails_helper"

feature "the job basket works" do
  before(:each) do
    listing = Listing.create(title: 'Beer n Stuff', description: 'We have lots of beer and plenty of stuff',
                            wage: '5000', hours: '6', number_of_positions: '1000', end_date: 'Dec 17'
                            )
  end

  it "can add view the all listings index" do
    visit root_path
    click_link_or_button 'All Listings'

    expect(page).to have_content('Job Listings')
    end

  # it "can add a listing to the basket form all listings" do
  #   visit root_path
  #   click_link_or_button 'All Listings'
  #   expect(page).to have_link('Add to Basket')

  #   # within('Beer n Stuff') do
  #   #   click_link_or_button('Add to Basket')
  #   # end
  # end

end