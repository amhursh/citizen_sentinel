require 'rails'

feature 'User can view a bill' do
  scenario 'user can click link to view full bill info' do
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

    click_on "View Bill"

    expect(page).to have_css('.number')
    expect(page).to have_css('.short-title')
    expect(page).to have_css('.title')
    expect(page).to have_css('.sponsor')
    expect(page).to have_css('.congressdotgov')
    expect(page).to have_css('.govtrack')
    expect(page).to have_css('.introduced-date')
    expect(page).to have_css('.congressdotgov')
    expect(page).to have_css('.subject')
    expect(page).to have_css('.status')
    expect(page).to have_css('.enacted')
    expect(page).to have_css('.committees')
    expect(page).to have_css('.last-action-date')
    expect(page).to have_css('.last-action')
    expect(page).to have_css('.summary')
    expect(page).to have_css('.actions')
  end
end
