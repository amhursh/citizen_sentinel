require 'rails_helper'

feature 'User can add issues' do
  scenario 'user can select from list of issues and add them to profile' do
    user = create(:user)
    issue1, issue2, issue3 = create_list(:issue, 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    expect(page).to_not have_content(issue1.name)
    expect(page).to_not have_content(issue2.name)
    expect(page).to_not have_content(issue3.name)

    expect(page).to have_content 'Add Issues You Would Like to Track'

    click_on 'Add Issues You Would Like to Track'

    expect(current_path).to eq user_issue_path

    check "check-issue-#{issue1.id}"
    check "check-issue-#{issue3.id}"

    click 'Add Issues'

    expect(current_path).to eq user_path(user)

    expect(page).to have_content issue1.name
    expect(page).to have_content issue3.name
    expect(page).to_not have_content issue2.name

    expect(page).to have_content "Recent Activity for #{issue1.name}"
    expect(page).to have_content "Recent Activity for #{issue3.name}"
  end
end
