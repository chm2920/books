class BaseController < ApplicationController
  
  before_filter :find_info, :find_cart
  
  def find_info    
    @nodes = Node.all
    @news_categories = NewsCategory.find(:all, :limit => 6)
    @tags = Tag.find(:all, :limit => 8)
  end
  
  def redirect_back
    redirect_to "/"
  end
  
  def find_cart
    if !session[:cart_id].nil?
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.new
      if !session[:user_id].nil?
        @cart.user_id = session[:user_id]
      else
        @cart.user_id = 0
      end
      @cart.save
      session[:cart_id] = @cart.id
    end
  end

end
