require 'rails_helper'

feature 'User can view issue activity' do
  scenario 'user can click to view recent activity associated with an issue' do
    user = create(:user)
    issue = create(:issue, name: 'Health', slug: 'health')
    user.issues << issue
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    click_on 'Followed Issues'
    click_on 'Check Activity'

    expect(current_path).to eq users_issue_path(issue)

    expect(page).to have_css(".bill", count: 20)

    within(first(".bill")) do
      expect(page).to have_css(".bill_number")
      expect(page).to have_css(".bill_uri")
      expect(page).to have_css(".title")
      expect(page).to have_css(".introduced_date")
      expect(page).to have_css(".committees")
      expect(page).to have_css(".last_action_date")
      expect(page).to have_css(".last_major_action")
    end
  end
end

# "number": "H.R.3922",
# "bill_uri": "https://api.propublica.org/congress/v1/115/bills/hr3922.json",
# "title": "To extend funding for certain public health programs, and for other purposes.",
# "sponsor_id": "W000791",
# "sponsor_uri": "https://api.propublica.org/congress/v1/members/W000791.json",
# "introduced_date": "2017-10-03",
# "cosponsors": 0,
# "committees": "House Ways and Means Committee",
# "latest_major_action_date": "2017-11-03",
# "latest_major_action": "Motion to reconsider laid on the table Agreed to without objection."
