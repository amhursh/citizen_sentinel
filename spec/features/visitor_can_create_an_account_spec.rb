require 'rails_helper'

feature 'Visitor can create and account' do
  scenario 'visitor can enter information to create an account' do
    # As a user,
    # I can visit the root page,
    visit '/'
    # and I can click on 'Sign Up'
    click_on 'Sign Up', match: :first
    # and I can choose to create an account
    # and I can fill in the information to create an account,
    expect(current_path).to eq new_user_path

    fill_in 'user[username]', with: 'aaron'
    fill_in 'user[email]', with: 'aaron@aaron.com'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'
    click_on 'Create Account'
    # and i should be on my user profile
    user = User.last

    expect(current_path).to eq user_path(user)
    # and i should see my information
    expect(page).to have_content user.username
    expect(page).to have_content user.email
  end
end
