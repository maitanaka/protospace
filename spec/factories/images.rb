include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :image do
    prototype

    image_url {fixture_file_upload("spec/fixture/sample.jpg")}
    status "main"


    trait :main do
      status :main
    end

    trait :sub do
      status :sub
    end

    factory :main_image, traits: [:main]
    factory :sub_image, traits: [:sub]

  end
end
