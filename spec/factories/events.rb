FactoryGirl.define do
  factory :event do
    event_category
    event_location
    title 'MyString'
    summary 'MyText'
    content 'MyText'
    event_start DateTime.now + 1.day
    event_end (DateTime.now + 2.hours) + 1.day
    booking_link 'MyString'
    booking_deadline (DateTime.now + 1.hour) + 1.day
    social_share_title 'MyString'
    social_share_description 'MyString'
    suggested_url 'MyString'
    display true

    trait :with_image do
      image { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
      social_share_image { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
    end
    factory :event_with_image, traits: [:with_image]
  end
end
