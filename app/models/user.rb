class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password

  # as a cart is temporary, if a user is deleted, no reason to keep the cart for that user in DB, delete cart too!
  has_one :cart, dependent: :destroy

  # still keep orders in DB when a user is deleted, for the audit trail of selling history from the shop side perspective
  has_many :orders


  # find current_user's cart's line_items' total products number
  # in order to update the page top right corner shopping bag number
  def get_total_products_number_in_cart
    if self.cart.line_items.length == 0
      total_products_number_in_cart = 0
    else
      total_products_number_in_cart = self.cart.line_items.sum{|li| li.quantity}
    end
  end
end
