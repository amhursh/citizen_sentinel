FactoryBot.define do
  factory :user do
    sequence :username do |i|
      "CoolUser#{i}"
    end

    sequence :email do |i|
      "cool_email_#{i}@email.com"
    end

    password "123456"
  end
end