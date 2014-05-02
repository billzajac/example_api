# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :app do
    name "MyString"
    description "MyText"
    author 1
    price "MyString"
    file_id "MyString"
  end
end
