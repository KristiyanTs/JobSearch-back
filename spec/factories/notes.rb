FactoryBot.define do
  factory :note do
    user { nil }
    title { "MyString" }
    content { "MyText" }
  end
end
