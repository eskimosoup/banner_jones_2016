FactoryGirl.define do
  factory :article do
    title 'Title'
    summary 'MyText'
    content '<p>MyText</p>'
    social_share_title 'MyString'
    social_share_description 'MyString'
    date Date.today
    suggested_url 'MyString'
    display true
    home_page_highlight false

    trait :with_image do
      image { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
      social_share_image { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
    end
    factory :article_with_image, traits: [:with_image]
  end
end
