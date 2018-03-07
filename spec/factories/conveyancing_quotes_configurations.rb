FactoryGirl.define do
  factory :conveyancing_quotes_configuration, :class => 'ConveyancingQuotes::Configuration' do
    title "MyString"
location "MyString"
style "MyString"
email_required false
phone_required false
show_legal_fee_prices false
show_legal_fee_subtotal false
show_additional_services_prices false
show_additional_services_subtotal false
show_additional_costs_prices false
show_additional_costs_subtotal false
  end

end
