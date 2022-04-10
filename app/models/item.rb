class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :sending

  belongs_to :user
  has_one_attached :image

  validates :image,         presence: true

  validates :product,       presence: true
  validates :discription,   presence: true
  validates :category_id,   numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :cost_id,       numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sending_id,    numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,         presence: true, format: { with: /\A[0-9]+\z/ }, numericality: { in: 300..9_999_999 , message: "is out of setting range"}

end
