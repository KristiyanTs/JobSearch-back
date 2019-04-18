FactoryBot.define do
  factory :log do
    content { "MyText" }
    user { nil }
    day { "2019-04-17" }
  end
end
