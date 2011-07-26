class Author < ActiveRecord::Base
  
  has_many :products
  
  def show_url
    "/author/#{self.id}"
  end
  
end
