FactoryBot.define do
  factory :item do
    title              { Faker::Lorem.words }
    content            { Faker::Lorem.sentences }
    price              { 10000 }
    condition_id       { 2 }
    shipping_id        { 2 }
    prefecture_id      { 2 }
    deliverydays_id    { 2 }
    category_id        { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample4.png'), filename: 'sample4.png')
    end
  end
end
