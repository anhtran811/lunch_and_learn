FactoryBot.define do
  factory :favorite do
    recipe_title { Faker::Book.title }
    recipe_link { Faker::Internet.url }
    country { Faker::Address.country }

    association :user
  end
end