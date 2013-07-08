require 'faker'

FactoryGirl.define do
    factory :thing do |t|
        t.name { Faker::Name.first_name }
    end
end
