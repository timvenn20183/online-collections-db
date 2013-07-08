# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    email_address "MyString"
    detail "MyText"
    thing_id 1
    blog_id 1
    gallery_id 1
    approved false
    name "MyString"
  end
end
