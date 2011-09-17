class Publisher < ActiveRecord::Base
  
  has_many :products
  
  def show_url
    "/publisher/#{self.id}"
  end
  
end
