class Publisher < ActiveRecord::Base
  
  has_many :publisher_products
  
  has_many :products, :through => :publisher_products
  
  
  def show_url
    "/publisher/#{self.id}"
  end
  
end
