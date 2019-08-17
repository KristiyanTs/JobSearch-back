FactoryBot.define do
  factory :membership do
    user { nil }
    node { nil }
    accepted { false }
  end
end
