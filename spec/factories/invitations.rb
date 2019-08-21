FactoryBot.define do
  factory :invitation do
    user { nil }
    node { nil }
    accepted { false }
    rejected { false }
  end
end
