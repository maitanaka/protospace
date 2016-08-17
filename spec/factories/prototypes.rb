FactoryGirl.define do
  factory :prototype do
    association :user, factory: :user, strategy: :build

    id 234
    name "TestUser"
    catchcopy "TestTest"
    concept "testtesttest"
  end
end
