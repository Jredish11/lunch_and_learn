FactoryBot.define do
  factory :user do
    country { Faker::Movies::Ghostbusters.actor }
    recipe_link { Faker::Internet.url }
    recipe_title { Faker::Movies::Ghostbusters.spell }
    association :user 
  end
end