class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :text
    validates :image
    validates :price
  end
  
  validates :price, numericality: {with:/\A[0-9]+\z/, message: "half-width number"}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "out of setting range"}

  with_options presence: true, numericality: { other_than: 1, message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :prefecture_id
    validates :shipping_day_id
  end
end
