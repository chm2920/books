class Publisher < ActiveRecord::Base
  
  has_many :products
  
  def show_url
    "/publish/#{self.id}"
  end
  
end
