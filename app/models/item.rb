class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase_history

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :ship_fee
  belongs_to :prefecture
  belongs_to :ship_day

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates :price, numericality: { less_than_or_equal_to: 9_999_999, greater_than_or_equal_to: 300 }
  end

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_day_id, numericality: { other_than: 1, message: "can't be blank" }

  
end
