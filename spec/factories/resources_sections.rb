FactoryGirl.define do
  factory :resources_section, :class => 'Resources::Section' do
    resource nil
position 1
title "MyString"
content "MyText"
image "MyString"
style "MyString"
display false
  end

end
