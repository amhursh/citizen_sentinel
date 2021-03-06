class Bill < ApplicationRecord
  has_many :user_bills
  has_many :users, through: :user_bills

  def self.from_pro_publica(raw_bill)
    bill = find_by(bill_id: raw_bill[:bill_slug]) || Bill.new
    bill.attributes = {
      bill_ref: raw_bill[:bill_id],
      bill_id: raw_bill[:bill_slug],
      title: raw_bill[:short_title],
      subject: raw_bill[:primary_subject],
      active: raw_bill[:active],
      enacted: raw_bill[:enacted]
    }
    bill.fix_nil_empty_title
    bill.fix_nil_empty_subject
    bill.save
    bill
  end

  def fix_nil_empty_title
    if title.nil? || title.empty?
      update(title: "Not Available. View full bill for information")
    end
  end

  def fix_nil_empty_subject
    if subject.nil? || subject.empty?
      update(subject: "Not Available. View full bill for information")
    end
  end

end
