class DonationAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :manicipality, :house_number, :building_name
end