class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :password, format: { with: /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)/ }
  
    validates :nickname
    with_options format: { with: /\A[ぁ-んァ-ン\p{Han}]/ } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :kana_lastname   
      validates :kana_firstname
    end
  validates :birth_day
  end
  has_many :items
  has_many :purchasings
  has_one :card, dependent: :destroy
end