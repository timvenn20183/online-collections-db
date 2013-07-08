# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blog do
    name "MyString"
    content "MyText"
    publish_date "2013-01-30"
    withdraw_date "2013-01-30"
    draft false
    front_page false
    order 1
    cached_slug "MyString"
  end
end
