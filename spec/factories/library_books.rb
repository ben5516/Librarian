# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :library_book do
    library 
    book 
    request_count 1
  end
end
