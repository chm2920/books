class Author < ActiveRecord::Base
  
  has_and_belongs_to_many :products
  
  def show_url
    "/author/#{self.id}"
  end
  
end
