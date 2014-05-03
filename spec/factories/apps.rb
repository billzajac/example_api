# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :app do
    sequence(:name) { |n| "Awesome VR App #{n}" }
    description "A totally awesome VR app!"
    author { "author_id_#{rand(0..9)}" }
    price { "#{rand(0..9)}.#{rand(0..9)}#{rand(0..9)}" }
    file_name { "some_file_name#{rand(0..99)}" }
    #file_data { Random.new.bytes(100) }
    file_mime_type "application/octet-stream"
  end
end
