class Admin::DoubansController < Admin::AdminBackEndController
    
  def index
    if !params[:douban_ids].nil?
      Douban.destroy_all(["id in (?)", params[:douban_ids]])
    end
    @doubans = Douban.all
  end

  def new
    @douban = Douban.new
  end

  def edit
    @douban = Douban.find(params[:id])
  end
  
  def create
    @douban = Douban.new(params[:douban])
    if @douban.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    @douban = Douban.find(params[:id])
    if @douban.update_attributes(params[:douban])
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @douban = Douban.find(params[:id])
    @douban.destroy
    redirect_to :action => "index"
  end 
  
end
