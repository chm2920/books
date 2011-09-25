class Tag < ActiveRecord::Base
  
  has_and_belongs_to_many :products
  
  def show_url
    "/tag/#{self.id}"
  end
  
end
