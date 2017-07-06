FactoryGirl.define do
  factory :conveyancing_quotes_address, :class => 'ConveyancingQuotes::Address' do
    conveyancing_quotes_user nil
address_type "MyString"
house_number "MyString"
address_line_1 "MyString"
address_line_2 "MyString"
town "MyString"
postcode "MyString"
  end

end
