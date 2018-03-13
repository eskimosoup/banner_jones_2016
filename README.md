
```ruby
Page.where(layout: 'application').update_all(layout: 'landing_page_design')
Page.where(style: 'basic').update_all(style: 'service_large')


Services::Page.where(layout: 'application').update_all(layout: 'landing_page_design')
Service.where(layout: 'application').update_all(layout: 'landing_page_design')
Services::Page.where(style: 'basic').update_all(style: 'service_large')
Services::Page.where(style: 'purchase_plus_offer').update_all(style: 'service_large')
Service.where(style: 'basic').update_all(style: 'service_large')

```

