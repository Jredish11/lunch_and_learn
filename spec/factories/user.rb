FactoryBot.define do
  factory :user do
    name { Faker::Movies::Ghostbusters.actor }
    email { Faker::Internet.url }
    password { Faker::Internet.password }
    api_key { Faker::Movies::Ghostbusters.actor }
  end
end