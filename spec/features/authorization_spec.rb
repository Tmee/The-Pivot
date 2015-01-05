require 'rails_helper'
require "cancan/matchers"



describe 'Application authorizaiton' do

  context 'when not logged in' do
    before(:each) do
      visit root_path
    end

    it 'cannot access the web admin page' do
      user = FactoryGirl.create(:user)
      visit admin_index_path
      expect(page).to have_content('Unauthorized, this computer is now being monitered')
      expect(page.current_path).to_not eq users_path
    end

    it 'cannot access the business admin page' do
      visit admin_url(subdomain: 'turing')
      expect(page).to have_content('Not Authorized')
      expect(page.current_path).to_not eq admin_path
    end

    it "cannot access a user's page" do
      visit user_path(1)
      expect(page).to have_content('Not Authorized')
      expect(page.current_path).to_not eq user_path
    end
  end

  # context 'when logged in' do
  #   user = FactoryGirl.create(:admin)
  #   visit login_path
  #   fill_in 'Email', with: user.email
  #   fill_in 'Password', with: user.password
  #   click_button 'Login'
  #   visit users_path
  #   expect(page).to have_content('All users')
  # end

end
