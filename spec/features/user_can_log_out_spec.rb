require 'rails_helper'

feature 'Registered user can log out' do
  scenario 'signed in user can click link to log out' do
    user = create(:user)

    visit '/'

    within '.signin-nav' do
      click_on 'Sign In'
    end

    expect(current_path).to eq new_login_path

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password

    within '.signin-form-submit' do
      click_on "Sign In"
    end

    click_on 'Sign Out'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Sign Up'
    expect(page).to have_content 'Sign In'
    expect(page).to_not have_content 'Sign Out'
    expect(page).to have_content 'Successfully Signed Out'
  end
end
