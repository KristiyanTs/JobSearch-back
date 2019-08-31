FactoryBot.define do
  factory :comment do
    user { nil }
    node { nil }
    content { "MyText" }
  end
end
