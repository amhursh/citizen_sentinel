require 'rails_helper'

feature 'Registered user can sign into an account' do
  scenario 'user can enter valid account information and click link to sign in' do
    user = create(:user)

    visit '/'

    within '.signin-nav' do
      click_on 'Sign In'
    end

    expect(current_path).to eq new_login_path

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password
    click_on "Sign In"

    expect(current_path).to eq user_path(user)
    expect(page).to have_content "Signed in as #{user.username}"
  end
end
