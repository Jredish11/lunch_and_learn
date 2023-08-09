FactoryBot.define do
  factory :favorite do
    country { Faker::Movies::Ghostbusters.actor }
    recipe_link { Faker::Internet.url }
    recipe_title { Faker::Movies::Ghostbusters.actor }
    association :user 
  end
end