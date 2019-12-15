FactoryBot.define do
  factory :vote do
    programming { false }
    english { false }
    bulgarian { false }
    finance { false }
    other { false }
    other_text { "MyString" }
    email { "MyString" }
  end
end
