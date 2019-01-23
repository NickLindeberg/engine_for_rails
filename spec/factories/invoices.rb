FactoryBot.define do
  factory :invoice do
    status { "Pending" }
    merchant { nil }
    customer { nil }
  end
end
