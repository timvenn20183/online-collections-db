# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :webring do
    name "MyString"
    active false
    code "MyText"
  end
end
