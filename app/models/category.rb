class Category < ActiveRecord::Base
  
  belongs_to :node
  
  def show_url
    "/c/#{self.id}"
  end
end
