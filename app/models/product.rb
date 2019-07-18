class Product < ApplicationRecord
  # as an admin, when creating new product, the below info are all necessary for a product
  validates_presence_of :name, :price, :description, :stock, :image, :category_id

  has_many :line_items
  has_many :orders, through: :line_items
  belongs_to :category, optional: true

end
