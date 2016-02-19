FactoryGirl.define do
  factory :office do
    office_location
    name "MyString"
    building_name "MyString"
    building_number "MyString"
    street "MyString"
    town "MyString"
    county "MyString"
    postcode "MyString"
    phone_number "MyString"
    fax_number "MyString"
    email "MyString"
    dx_number "MyString"
    details "MyString"
    display true
    suggested_url "MyString"

    trait :with_image do
      image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end
    factory :office_with_image, traits: [:with_image]
  end

end
