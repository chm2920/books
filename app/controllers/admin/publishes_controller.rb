class Admin::PublishesController < Admin::AdminBackEndController
    
  def index
    if !params[:publish_ids].nil?
      Publish.destroy_all(["id in (?)", params[:publish_ids]])
    end
    @publishes = Publish.all
  end

  def new
    @publish = Publish.new
  end

  def edit
    @publish = Publish.find(params[:id])
  end
  
  def create
    @publish = Publish.new(params[:publish])
    if @publish.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    @publish = Publish.find(params[:id])
    if @publish.update_attributes(params[:publish])
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @publish = Publish.find(params[:id])
    @publish.destroy
    redirect_to :action => "index"
  end  

end
