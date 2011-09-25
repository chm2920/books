class StartController < BaseController
  
  def index
    @publishers = Publisher.all(:limit => 10)
    @authors = Author.all(:limit => 10)
    @new_products = Product.new_ps
    @re_products = Product.re_ps
  end
  
  def about
    @news_categories = NewsCategory.find(:all, :limit => 6)
    @news_topic = NewsTopic.find(params[:id])
    render :layout => "note"
  end
  
  def query
    render :layout => "note"
  end
  
  def query_rst
    render :layout => "note"
  end
  
end
