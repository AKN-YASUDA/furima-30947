class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :delivery_fee
  belongs_to :shipment_date
  belongs_to :user
  has_one :purchasing
  has_one_attached :image

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :price, numericality: {greater_than_or_equal_to: 300,less_than: 10000000}
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :shipment_date_id
    end
  end
end
