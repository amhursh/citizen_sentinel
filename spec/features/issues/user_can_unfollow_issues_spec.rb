require 'rails_helper'

feature 'User can unfollow issues' do
  scenario 'User can click link to unfollow issues' do
    user = create(:user)
    issue1, issue2, issue3, issue4, issue5, issue6 = create_list(:issue, 6)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    expect(page).to_not have_content(issue1.name)
    expect(page).to_not have_content(issue2.name)
    expect(page).to_not have_content(issue3.name)

    expect(page).to have_content 'Follow/Unfollow Issues'

    click_on 'Follow/Unfollow Issues'

    expect(current_path).to eq issues_path

    within ".issue#{issue1.id}" do
      click_on 'Follow'
    end

    within ".issue#{issue3.id}" do
      click_on 'Follow'
    end

    expect(page).to have_content "Followed Issue: #{issue3.name}. See This Issue on Your Profile"

    click_on 'See This Issue on Your Profile'

    expect(current_path).to eq user_path(user)

    click_on 'Followed Issues'

    expect(page).to have_content issue1.name
    expect(page).to have_content issue3.name
    expect(page).to_not have_content issue2.name

    visit issues_path

    within ".issue#{issue1.id}" do
      click_on 'Unfollow'
    end

    expect(page).to have_content "Unfollowed Issue: #{issue1.name}"

    visit user_path(user)

    click_on 'Followed Issues'

    expect(page).to have_content issue3.name
    expect(page).to_not have_content issue1.name
  end
end