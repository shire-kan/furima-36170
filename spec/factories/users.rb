FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    first_name            {Faker::Japanese::Name.first_name}
    last_name             {Faker::Japanese::Name.last_name}
    first_kana            {Faker::Japanese::Name.first_name.yomi}
    last_kana             {Faker::Japanese::Name.last_name.yomi}
    birthday              {Faker::Date.birthday}
  end
end
