FactoryBot.define do
  factory :item do
    name{Faker::Lorem.sentence}
    text{Faker::Lorem.sentence}
    category_id{2}
    condition_id{2}
    fee_id{2}
    prefecture_id{2}
    shipping_day_id{2}
    price{2000}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open("public/images/test_image.png"), filename: "test_image.png")
    end
  end
end
