require 'rails_helper'

feature 'User can unfollow bills' do
  scenario 'user can click a button to unfollow bills' do
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

    expect(page).to have_content bill.bill_id
    expect(page).to have_content bill.title
    expect(page).to have_content bill.subject

    click_on 'Unfollow'

    expect(page).to_not have_content bill.bill_id
  end
end