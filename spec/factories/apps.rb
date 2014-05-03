# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :app do
    sequence(:name) { |n| "Awesome VR App #{n}" }
    description "A totally awesome VR app!"
    author { "author_id_#{rand(0..9)}" }
    price { "#{rand(0..9)}.#{rand(0..9)}#{rand(0..9)}" }
    binary { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.txt'), 'text/plain') }
  end
end
