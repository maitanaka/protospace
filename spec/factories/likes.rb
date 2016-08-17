FactoryGirl.define do
  factory :like do
    id Faker::Number.number(3)
    prototype
    user
  end
end
