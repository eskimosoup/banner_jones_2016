# From old site to new site

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

On new site to reflect removal of _2018 in layouts
```ruby
[Page, Services::Page, Service].each do |x|
  x.where("layout LIKE ?", "%_2018").each do |y|
    puts y.layout
  end
end

Page.where(layout: 'landing_page_design').update_all(layout: 'application')
Services::Page.where(layout: 'landing_page_design').update_all(layout: 'application')
Service.where(layout: 'landing_page_design').update_all(layout: 'application')

Service.where(layout: 'notary_2018').update_all(layout: 'notary')
Service.where(layout: 'wealth_management_2018').update_all(layout: 'wealth_management')

Services::Page.where(layout: 'notary_2018').update_all(layout: 'notary')
Services::Page.where(layout: 'wealth_management_2018').update_all(layout: 'wealth_management')

Page.where(layout: 'notary_2018').update_all(layout: 'notary')
Page.where(layout: 'wealth_management_2018').update_all(layout: 'wealth_management')
```

```ruby
Optimadmin::SiteSetting.where(environment: 'production').update_all(environment: 'staging')
```
