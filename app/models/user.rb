class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password

  # as a cart is temporary, if a user is deleted, no reason to keep the cart for that user in DB, delete cart too!
  has_one :cart, dependent: :destroy

  # still keep orders in DB when a user is deleted, for the audit trail of selling history from the shop side perspective
  has_many :orders
end
