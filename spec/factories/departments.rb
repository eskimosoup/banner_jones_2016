FactoryGirl.define do
  factory :department do
    sequence(:id) { |n| n }
    audience
    sequence(:title) { |n| "Title #{n}" }
    summary 'MyText'
    display true

    trait :with_services do
      after(:build) do |department|
        department.services = build_list(:service, 2, department: department)
      end
    end

    factory :department_with_services, traits: [:with_services]

    trait :with_image do
      image { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
      social_share_image { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
    end

    factory :department_with_image, traits: [:with_image]
  end
end
