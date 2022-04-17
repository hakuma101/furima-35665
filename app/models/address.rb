class Address < ApplicationRecord
  validates :postal_code,    presence: true
  validates :prefecture_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :manicipality,   presence: true
  validates :house_number,   presence: true
  validates :phone_number,   presence: true
end
