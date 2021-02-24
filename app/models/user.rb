class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)/}
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン\p{Han}]/}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン\p{Han}]/ }
  validates :kana_lastname, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }   
  validates :kana_firstname, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } 
  validates :birth_day, presence: true

end