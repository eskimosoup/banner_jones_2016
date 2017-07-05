FactoryGirl.define do
  factory :conveyancing_quotes_user, :class => 'ConveyancingQuotes::User' do
    forename "MyString"
surname "MyString"
email "MyString"
phone "MyString"
buying false
selling false
conveyancing_email_permission false
  end

end
