FactoryGirl.define do
  factory :service_related_service do
    service
    related_service { build(:service) }
  end
end
