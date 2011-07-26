class StartController < ApplicationController
  
  def index
    @new_products = Product.new_ps
    @re_products = Product.re_ps
  end
  
  def about
    @news_topic = NewsTopic.find(params[:id])
  end
  
end
