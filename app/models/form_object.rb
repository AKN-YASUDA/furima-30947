class FormObject
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :town, :house_number, :building_name, :phone
  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :town
    validates :house_number
    validates :phone,  numericality: { only_integer: true }, format: { with: /\A[0-9]{,11}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :user_id
    validates :item_id
    end

  def save
    Address.create(postcode: postcode, prefecture_id: prefecture_id, town: town, house_number: house_number, building_name: building_name, phone: phone)
    Purchasing.create(item_id: item_id, user_id: user_id)
  end
end