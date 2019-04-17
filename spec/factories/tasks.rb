FactoryBot.define do
  factory :task do
    title { "MyString" }
    body { "MyText" }
    completed { false }
    recurrent { false }
    flag { "MyString" }
    user { nil }
    day { "2019-04-14" }
  end
end
