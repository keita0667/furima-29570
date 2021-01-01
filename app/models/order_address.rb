class OrderAddress
  include ActiveModel::Model

  attr_accessor :token, :price, :token, :postal_code, :prefecture_id, :city, :addresses, :phone_number, :building_name,
                :user_id, :item_id, :order_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :addresses
    validates :phone_number, numericality: { only_integer: true, message: 'is invalid. Input half-width characters.' }
  end

  def save
    # orderの情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses,
                   building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
