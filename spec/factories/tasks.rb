FactoryBot.define do
  factory :task do
    title { "MyString" }
    completed { false }
    user { 1 }
    day { "2019-04-14" }
  end
end
