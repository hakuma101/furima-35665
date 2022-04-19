class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :sending

  belongs_to :user
  has_one_attached :image

  has_one :order

  with_options presence: true do
    validates :image
    validates :product
    validates :discription
    validates :price
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :cost_id
    validates :prefecture_id
    validates :sending_id
  end

  validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000, message: 'is out of setting range' }

end
