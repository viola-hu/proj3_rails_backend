class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  def after_payment_change_product_stock
    # deduct the purchased quantity of the line_item from its product's existing stock number
    self.line_items.each do |line_item|
      line_item.product.decrement!( :stock, line_item.quantity )
    end
  end

  def order_created_at_date_formatted
    self.created_at.strftime("%d %b %Y")
  end

  def order_total_amount
    self.line_items.sum{|li| li.quantity * li.product.price}    
  end

end
