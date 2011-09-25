class Cart < ActiveRecord::Base
  
  belongs_to :user
  has_many :cart_items
  
  def p_count
    self.cart_items.length
  end
  
  def total_price
    "0"
  end
  
end
