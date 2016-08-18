FactoryGirl.define do
  factory :comment do
    prototype
    text Faker::Lorem.sentence
  end
end
