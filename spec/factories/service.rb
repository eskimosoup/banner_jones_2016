FactoryGirl.define do
  factory :service do
    sequence(:id) { |n| n }
    audience nil
    sequence(:title) { |n| "Title #{n}" }
    summary 'MyText'
    content 'MyText'
    social_share_title 'MyString'
    social_share_description 'MyString'
    publish_at Time.zone.now - 1.day

    trait :with_children do
      after(:build) do |service|
        service.children = build_list(:service, 2, parent: service)
      end
    end

    trait :homepage_highlight do
      homepage_highlight true
    end

    factory :service_with_children, traits: [:with_children]
    factory :service_with_homepage_highlight, traits: [:homepage_highlight]
  end
end
