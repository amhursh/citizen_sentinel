require 'rails_helper'

feature 'User can track specific bills' do
  scenario 'user can view issue activity and add associated bill to track' do
    user = create(:user)
    issue = create(:issue, name: 'Health', slug: 'health')
    user.issues << issue
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    click_on 'Followed Issues'
    click_on 'Check Activity'

    expect(current_path).to eq users_issue_path(issue)

    click_on 'Follow this Bill', match: :first
    
    bill = Bill.last

    expect(current_path).to eq users_issue_path(issue)
    expect(page).to have_content "Followed Bill: #{bill.bill_id}"
    expect(page).to have_css '.followed-bill'

    click_on 'My Profile'

    click_on 'Followed Bills'

    expect(page).to have_content bill.name
    expect(page).to have_content bill.short_title
    expect(page).to have_content bill.subject
  end
end
