include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :image do
    prototype

    image_url {fixture_file_upload("spec/fixture/sample.jpg")}

    trait :main do
      status :main
    end

    trait :sub do
      status
    end

  end
end
