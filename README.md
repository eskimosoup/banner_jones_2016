
```ruby
Page.where(layout: 'application').update_all(layout: 'landing_page_design')
Page.where(style: 'basic').update_all(style: 'service_large')


Services::Page.where(layout: 'application').update_all(layout: 'landing_page_design')
Service.where(layout: 'application').update_all(layout: 'landing_page_design')

Service.where(layout: 'notary').update_all(layout: 'notary_2018')
Service.where(layout: 'wealth_management').update_all(layout: 'wealth_management_2018')

Services::Page.where(layout: 'notary').update_all(layout: 'notary_2018')
Services::Page.where(layout: 'wealth_management').update_all(layout: 'wealth_management_2018')

Page.where(layout: 'notary').update_all(layout: 'notary_2018')
Page.where(layout: 'wealth_management').update_all(layout: 'wealth_management_2018')

Services::Page.where(style: 'basic').update_all(style: 'service_large')
Services::Page.where(style: 'purchase_plus_offer').update_all(style: 'service_large')
Service.where(style: 'purchase_plus_offer').update_all(style: 'service_large')
Services::Page.where(style: 'purchase_plus').update_all(style: 'service_large')
Service.where(style: 'purchase_plus').update_all(style: 'service_large')
Service.where(style: 'basic').update_all(style: 'service_large')
```
```ruby
Optimadmin::SiteSetting.where(environment: 'production').update_all(environment: 'staging')
```
