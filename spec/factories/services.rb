FactoryGirl.define do
  factory :service do
    sequence(:id) { |n| n }
    department
    title 'MyString'
    summary 'MyText'
    content 'MyText'
    image 'MyString'
    social_share_title 'MyString'
    social_share_description 'MyString'
    display true

    trait :with_image do
      image { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
      social_share_image { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
    end
    factory :service_with_image, traits: [:with_image]
  end
end
