FactoryBot.define do
  factory :payment do
    membership { nil }
    amount { 1 }
    note { "MyText" }
  end
end
