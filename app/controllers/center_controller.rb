class CenterController < BaseController
  
  before_filter :find_user
  
  def index
    
  end
  
  def orders
    
  end
  
  def favors
    @favors = @user.favors.paginate :page => params[:page], :per_page => 20, :order => "id desc"
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
