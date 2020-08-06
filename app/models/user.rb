class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :items
  has_many :item_purchases

  with_options presence: true do
    validates :nickname, uniqueness: { case_sensitive: true }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

    VALID_PASSWORD = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
    validates :password, format: { with: VALID_PASSWORD }, confirmation: true

    VALID_NAME = /\A[ぁ-んァ-ン一-龥]/
    validates :sur_name, format: { with: VALID_NAME }
    validates :given_name, format: { with: VALID_NAME }

    VALID_KANA_NAME = /\A[ァ-ヶー－]+\z/
    validates :sur_name_kana, format: { with: VALID_KANA_NAME }
    validates :given_name_kana, format: { with: VALID_KANA_NAME }

    validates :date_of_birth
  end
end