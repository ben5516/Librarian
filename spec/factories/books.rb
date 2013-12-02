# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    title { Faker::Lorem.word }
    ISBN { Faker::Code.isbn }
  end
end
