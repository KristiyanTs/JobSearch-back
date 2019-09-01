FactoryBot.define do
  factory :comment do
    user { nil }
    content { "MyText" }
    commentable_type { "MyString" }
    commentable_id { 1 }
  end
end
