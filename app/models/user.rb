class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cards
  has_many :products
  has_many :trade, class_name:"Transaction", foreign_key: "transaction_id"
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_NAME_KANA = /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/
  VALID_NAME = /\A[ぁ-んァ-ヶー一-龠]+\z/
  # validates :nickname, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday_yyyy, :birthday_mm, :birthday_dd, presence: true
  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday_yyyy, :birthday_mm, :birthday_dd, presence: true
  validates :password, presence: true, on: :create
  validates :password, length: { minimum: 7 }, on: :create
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :first_name_kana, :last_name_kana, presence: true, format: { with: VALID_NAME_KANA }
  validates :first_name, :last_name, presence: true, format: { with: VALID_NAME }

  def update_without_password(params, *options)
    params.delete(:current_password)
    
    if params[:password].blank? && params[:password_confirmation].blank?
      
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

end
