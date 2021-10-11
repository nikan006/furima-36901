class OrderDeliverys
  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :city, :adress1, :adress2, :telephone, :order, :item_id, :user_id, :token
  
  with_options presence: true do
    validates :zip_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :city
    validates :adress1
    validates :telephone, format: {with: /\A\d{10,11}\z/}
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: {other_than: 1}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Delivery.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, adress1: adress1, adress2: adress2, telephone: telephone, order_id: order.id)
  end
end