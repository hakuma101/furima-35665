class DonationAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :manicipality, :house_number, :building_name

  validates :postal_code,    presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :manicipality,   presence: true
  validates :house_number,   presence: true
  validates :phone_number,   presence: true, format: {with: /\A[0-9]{,11}\z/, message: ""}
end