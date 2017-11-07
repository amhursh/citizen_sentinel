class Bill < ApplicationRecord

  def self.from_pro_publica(raw_bill)
    bill = find_by(bill_id: raw_bill[:bill_slug]) || Bill.new
    bill.attributes = {
      bill_id: raw_bill[:bill_slug],
      title: raw_bill[:short_title],
      subject: raw_bill[:primary_subject],
      active: raw_bill[:active],
      enacted: raw_bill[:enacted]
    }
    binding.pry
    bill.save
    bill
  end



end
