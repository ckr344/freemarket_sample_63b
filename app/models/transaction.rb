class Transaction < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :product, optional: true

  validates :user_id, presence: true
  validates :product_id, presence: true, uniqueness: true
end