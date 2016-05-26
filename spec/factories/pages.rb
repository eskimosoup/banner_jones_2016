FactoryGirl.define do
  factory :page do
    title 'Page title'
    subtitle 'Page subtitle'
    style 'basic'
    layout 'application'
    summary 'summary'
    content '<p>test</p>'
    publish_at Time.zone.now
    social_share_title 'MyString'
    social_share_description 'MyString'
    trait :with_image do
      social_share_image { File.open(File.join(OptimisedSite::Engine.root, 'spec/support/images/landscape_image.jpg')) }
      image { File.open(File.join(OptimisedSite::Engine.root, 'spec/support/images/landscape_image.jpg')) }
    end
    factory :page_with_image, traits: [:with_image]
  end
end
