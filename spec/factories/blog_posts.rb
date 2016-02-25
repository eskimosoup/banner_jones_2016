FactoryGirl.define do
  factory :blog_post do
    blog_category
    title 'MyString'
    summary 'MyText'
    content '<p>MyText</p>'
    date Date.today
    social_share_title 'MyString'
    social_share_description 'MyString'
    display true

    trait :with_image do
      image { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
      social_share_image { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
    end
    factory :blog_post_with_image, traits: [:with_image]
  end
end
