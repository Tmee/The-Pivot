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
      expect(page).to have_button('Login')
    end

    it 'has a Register link' do
      expect(page).to have_button('Register')
    end

    it 'does not have a logout link' do
      expect(page).to_not have_button('Logout')
    end

    it 'does not have a dashboard link' do
      expect(page).to_not have_link('Dashboard')
    end

    it 'does not have an admin link' do
      expect(page).to_not have_link('Admin Home')
    end

    it 'has link to the Job Basket' do
      expect(page).to have_link('Job Basket')
    end
  end

  context 'when logged in' do
    before(:each) do
      User.create(full_name: "Josh Cheek",
                  email: "demo+josh@jumpstartlab.com",
                  password: "password",
                  password_confirmation: "password",
                  user_name: "josh",
                  admin: true
                  )

      visit login_path

        within('#LoginModal') do
          fill_in 'Email', with: 'demo+josh@jumpstartlab.com'
          fill_in 'Password', with: 'password'
          click_button 'Login'
      end
    end

    it 'logs in an existing user' do
      expect(page).to have_link('Logout')
    end

    it 'does not have a login link' do
      expect(page).to_not have_link('Login')
    end

    it 'can logout' do
      click_link_or_button 'Logout'
      expect(page).to_not have_link 'Logout'
      expect(page).to have_content 'You are logged out'
    end
  end
end
