FactoryBot.define do
  factory :review do
    title                    { 'テスト' }
    category_id              { '2' }
    product_name             { 'テスト' }
    brand                    { 'テスト' }
    purchase_date            { Faker::Date.between(from: '1930-01-01', to: Date.today) }
    user_type                { '2' }
    positive_point           { Faker::Lorem.sentence }
    negative_point           { Faker::Lorem.sentence }
    recommendation           { Faker::Lorem.sentence }

    association :user # ユーザーとのアソシエーション

    after(:build) do |review|
      review.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
