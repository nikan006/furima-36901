class OrderDeliverys
  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :city, :adress1, :adress2, :telephone, :order, :item, :user

  with_options presence: true do
    validates :zip_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :city
    validates :adress1
    validates :telephone, format: {with: /\A\d{10,11}\z/}
  end
  validates :prefecture_id, numericality: {other_than: 1}

  def save
    user = User.create(nickname: nickname, email: email, password: password, family_name: family_name, first_name: first_name, family_name_kana: family_name_kana, first_name_kana: first_name_kana, birth_date: birth_date)
    Item.create(name: name, text: text, category_id: category.id, condition_id: condition.id, fee_id: fee.id, prefecture_id: prefecture.id, shipping_day_id: shipping_day.id, price: price, user_id: user.id)
  end
end