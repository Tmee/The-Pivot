require 'rails_helper'

describe 'user authentication', type: :feature do
  it 'creates a user' do
    visit root_path

    within('#RegModal') do
      fill_in 'user_full_name', with: 'Zach Routh'
      fill_in 'user_user_name', with: 'zRouth'
      fill_in 'user_email', with: 'zach12345@turing.io'
      fill_in("Password", with: 'password')
      fill_in('Password confirmation', with: 'password')
      click_button 'Register'
    end

    expect(page).to have_content("User created")
  end

  context 'when not logged in' do
    before(:each) { visit root_path }

    it 'has a Log in link' do
      expect(page).to have_button('Login!')
    end

    it 'has a Register! link' do
      expect(page).to have_button('Register!')
    end

    it 'does not have a logout link' do
      expect(page).to_not have_button('Logout')
    end
  end



  context 'when logged in' do
    before(:each) do
      user_email    = 'demo+rachel@jumpstartlab.com'
      user_password = 'password'
      visit login_path
      fill_in 'Email', with: user_email
      fill_in 'Password', with: user_password
      click_button 'Login'
    end

    it 'logs in an existing user' do
      expect(page).to have_buton('Logout')
    end

    it 'does not have a login link' do
      expect(page).to_not have_link('Sign in')
    end

    it 'can logout' do
      click_link_or_button 'Logout'
      expect(page).to_not have_link 'Logout'
      expect(page).to have_link 'Sign in'
    end
  end
end
