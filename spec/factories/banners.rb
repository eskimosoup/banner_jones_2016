FactoryGirl.define do
  factory :banner do
    position 1
    title 'MyString'
    summary 'MyText'
    image { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
    display true

    trait :with_button do
      button_text 'Button text'
      button_link 'Button link'
    end
    factory :banner_with_button, traits: [:with_button]
  end
end
