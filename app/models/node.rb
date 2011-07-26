class Node < ActiveRecord::Base
  
  has_many :categories
  
  def show_url
    "/n/#{self.alias}"
  end
  
end
