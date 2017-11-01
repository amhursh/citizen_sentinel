require 'rails_helper'

feature 'Visitor can visit welcome page' do
  scenario 'and can see site title and login link' do
    visit '/'

    expect(page).to have_content 'CitizenSentinal'
    expect(page).to have_content 'Sign Up'
    expect(page).to have_content 'Sign In'
  end
end
