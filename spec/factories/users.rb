FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    encrypted_password    {'000000'}
    password_confirmation {encrypted_password}
    first_name            {'名前'}
    last_name             {'苗字'}
    first_kana            {'ナマエ'}
    last_kana             {'ミョウジ'}
    birthday              {'1930-01-01'}
  end
end
