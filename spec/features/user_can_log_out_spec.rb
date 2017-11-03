require 'rails_helper'

feature 'Registered user can log out' do
  scenario 'signed in user can click link to log out' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    click_on 'Sign Out'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Sign Up'
    expect(page).to have_content 'Sign In'
    expect(page).to_not have_content 'Sign Out'
    expect(page).to have_content 'Successfully Signed Out'
  end
end
