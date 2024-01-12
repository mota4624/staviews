FactoryBot.define do
  factory :user do
    name                  { '山田 太郎' }
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    affiliation           { '千葉店' }
    position              { '店長' }
  end

  after(:build) do |user|
    user.avatar.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
end
