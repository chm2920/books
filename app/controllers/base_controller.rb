class BaseController < ApplicationController
  
  before_filter :find_info
  
  def find_info    
    @nodes = Node.all
    @news_categories = NewsCategory.find(:all, :limit => 6)
  end

end
