FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {Faker::Japanese::Name.first_name}
    last_name             {Faker::Japanese::Name.last_name}
    first_kana            {Faker::Japanese::Name.first_name.yomi}
    last_kana             {Faker::Japanese::Name.last_name.yomi}
    birthday              {Faker::Date.birthday}
  end
end
