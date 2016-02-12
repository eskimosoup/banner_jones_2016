FactoryGirl.define do
  factory :testimonial do
    content "MyText"
    author_name "MyString"
    author_company "MyString"
    display true
    position 1

    trait :with_image do
      image { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
    end
    factory :testimonial_with_image, traits: [:with_image]
  end

end
