FactoryGirl.define do
  factory :award do
    position 1
    title 'MyString'
    image { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
    display true

    trait :with_link do
      link 'http://www.google.com'
    end
    factory :award_with_link, traits: [:with_link]
  end
end
