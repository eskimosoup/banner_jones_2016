FactoryGirl.define do
  factory :optimadmin_menu_item, class: Optimadmin::MenuItem do
    link nil
    name "Menu item name"
    menu_name "Menu name"
  end
end
