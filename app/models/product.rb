class Product < ApplicationRecord
  validates_presence_of :name, :price, :description, :stock, :image, :category_id

  has_many :line_items
  has_many :orders, through: :line_items
  belongs_to :category, optional: true

end
