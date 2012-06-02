FactoryGirl.define do
  sequence :name do |n| 
    "Idea ##{n}"
  end

  factory :idea do
    name { generate :name }
    description { Faker::Lorem.paragraph }
    picture { File.new(File.expand_path('rails.png', 'app/assets/images')) }
    
    factory :persisted_idea do
      # id { |n| n }
      created_at { 1.week.ago }
      updated_at { 1.day.ago }
    end
  end
end
