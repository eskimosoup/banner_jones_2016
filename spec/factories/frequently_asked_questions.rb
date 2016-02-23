FactoryGirl.define do
  factory :frequently_asked_question do
    question 'MyString'
    answer '<p>MyText</p>'
    position 1
    display true
  end
end
