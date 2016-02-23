FactoryGirl.define do
  factory :banner do
    position 1
    title 'MyString'
    summary 'MyText'
    image { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
    display true
  end
end
