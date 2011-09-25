class OrdersController < BaseController
  
  before_filter :find_user
  
  def add_to_favor
    @product = Product.find(params[:id])
    @favor = Favor.new
    @favor.user_id = @user.id
    @favor.product_id = @product.id
    @favor.save
    redirect_to "/u/favors"
  end
  
  def remove_favor
    @favor = Favor.find(params[:id])
    @favor.destroy
    redirect_to "/u/favors"    
  end
  
  def buy
    
  end
  
  def order
    
  end
  
private

  def find_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      flash[:notice] = "login first pls."
      redirect_to "/login"
    end
  end
  
end
