class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :manicipality, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  validates :postal_code,    presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :manicipality,   presence: true
  validates :house_number,   presence: true
  validates :phone_number,   presence: true, format: {with: /\A[0-9]{,11}\z/, message: ""}
  validates :user_id,        presence: true
  validates :item_id,        presence: true
  validates :token,          presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, manicipality: manicipality, house_number: house_number,
                   building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end