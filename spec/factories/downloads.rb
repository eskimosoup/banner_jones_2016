FactoryGirl.define do
  factory :download do
    title 'MyString'
    summary 'MyText'
    description 'MyText'
    file { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
    download_category
    suggested_url 'MyString'
    display true

    trait :with_image do
      image { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
    end
    factory :download_with_image, traits: [:with_image]
  end
end
