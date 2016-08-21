FactoryGirl.define do
  factory :prototype do

    name       { Faker::Commerce.product_name }
    catchcopy  { Faker::Company.catch_phrase }
    concept     { Faker::Lorem.sentence }
    created_at  { Faker::Time.between(2.days.ago, Time.now, :all) }

  end
end
