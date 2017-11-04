require 'rails_helper'

feature 'User can log in with facebook' do
  scenario 'user with facebook account can authorize app and log in' do
    stub_omniauth

    visit '/'

    within '.signin-nav' do
      click_on 'Sign In'
    end

    click_on 'facebook-login'

    expect(current_path).to eq user_path(User.last)
    expect(page).to have_content 'Aaron Hursh'
    expect(page).to have_content 'Sign Out'
    expect(page).to_not have_content 'Sign In'
    expect(page).to_not have_content 'Sign Up'
  end
end
