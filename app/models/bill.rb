class Bill < ApplicationRecord

  def from_pro_publica(raw_bill)
    bill = find_by(bill_id: raw_bill[:bill_slug]) || Bill.new
    bill.attributes = {
      bill_id: info[:uid],
      username: info[:info][:name],
      email: info[:info][:email],
      password: info[:uid],
      oauth_token: info[:credentials][:token],
      oauth_expire: info[:credentials][:expires_at],
      image: info[:info][:image]
    }
    bill.save
    bill
  end
end
