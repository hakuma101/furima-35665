class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :manicipality, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :manicipality
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid. Input only number"}
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id,  numericality: { other_than: 1, message: "can't be blank" }

  validates :phone_number, length: { minimum: 10, message: "is too short"}
  validates :phone_number, length: { maximum: 11, message: "is too long"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, manicipality: manicipality, house_number: house_number,
                   building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end