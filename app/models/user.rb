class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cards
  has_many :products
  validates :nickname, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday_yyyy, :birthday_mm, :birthday_dd, presence: true
  validates :password, length: { minimum: 7 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :kind, inclusion: { in: %w(draft publish private) }
  VALID_NAME_KANA = /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/
  validates :first_name_kana, :last_name_kana, presence: true, uniqueness: true, format: { with: VALID_NAME_KANA }
  VALID_NAME = /\A[ぁ-んァ-ヶー一-龠]+\z/
  validates :first_name, :last_name, presence: true, uniqueness: true, format: { with: VALID_NAME }

end
