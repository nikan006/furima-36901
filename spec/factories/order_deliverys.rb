FactoryBot.define do
  factory :order_deliverys do
    zip_code{"123-4567"}
    prefecture_id{3}
    city{"東京都"}
    adress1{"品川区1-1"}
    adress2{"イーストワンタワー23F"}
    telephone{"08012342580"}
    token{"tok_abcdefghijk00000000000000000"}
  end
end
