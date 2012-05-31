FactoryGirl.define do
  sequence :name do |n| 
    "Idea ##{n}"
  end

  factory :idea do
    name { generate :name }
    description { Faker::Lorem.paragraph }
    picture { File.new(File.expand_path('rails.png', 'app/assets/images')) }
  end
end
