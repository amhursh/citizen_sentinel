FactoryBot.define do
  factory :issue do
    sequence :name do |i|
      "Important Issue#{i}"
    end

    sequence :slug do |i|
      "important-issue-#{i}"
    end
  end
end