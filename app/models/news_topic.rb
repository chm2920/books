class NewsTopic < ActiveRecord::Base
  
  belongs_to :news_category
  
  def show_url
    "/about/#{self.id}"
  end
  
end
