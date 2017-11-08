require 'rails_helper'

RSpec.describe Bill, type: :model do

  context "class methods" do
    it '.from_pro_publica' do
      raw_bill = {
        :bill_id=>"s3674-110",
        :bill_slug=>"s3674",
        :congress=>"110",
        :bill=>"S.3674",
        :bill_type=>"s",
        :number=>"S.3674",
        :bill_uri=>"https://api.propublica.org/congress/v1/110/bills/s3674.json",
        :title=>"A bill to amend the Public Health Service Act to establish a Wellness Trust.",
        :short_title=>nil,
        :sponsor_title=>"",
        :sponsor=>"Hillary Rodham Clinton",
        :sponsor_id=>"C001041",
        :sponsor_uri=>"https://api.propublica.org/congress/v1/members/C001041.json",
        :sponsor_party=>"D",
        :sponsor_state=>"NY",
        :gpo_pdf_uri=>nil,
        :congressdotgov_url=>"https://www.congress.gov/bill/110th-congress/senate-bill/3674",
        :govtrack_url=>"https://www.govtrack.us/congress/bills/110/s3674",
        :introduced_date=>"2008-10-01",
        :active=>nil,
        :last_vote=>nil,
        :house_passage=>nil,
        :senate_passage=>nil,
        :enacted=>false,
        :vetoed=>nil,
        :cosponsors=>0,
        :cosponsors_by_party=>{},
        :withdrawn_cosponsors=>0,
        :primary_subject=>"",
        :committees=>"Senate Health, Education, Labor, and Pensions",
        :committee_codes=>[],
        :subcommittee_codes=>[],
        :latest_major_action_date=>"2008-10-01",
        :latest_major_action=>
        "Referred to Senate committee. Status: Read twice and referred to the Committee on Health, Education, Labor, and Pensions.",
        :house_passage_vote=>nil,
        :senate_passage_vote=>nil,
        :summary=>"",
        :summary_short=>"",
        :versions=>[],
        :actions=>[],
        :votes=>[]
      }

      Bill.from_pro_publica(raw_bill)
      bill = Bill.first

      expect(bill.bill_ref).to eq "s3674-110"
      expect(bill.title).to eq "Not Available. View full bill for information"
      expect(bill.subject).to eq "Not Available. View full bill for information"
    end
  end
end
