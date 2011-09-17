class Admin::PublishersController < Admin::AdminBackEndController
    
  def index
    if !params[:publisher_ids].nil?
      Publisher.destroy_all(["id in (?)", params[:publisher_ids]])
    end
    @publishers = Publisher.all
  end

  def new
    @publisher = Publisher.new
  end

  def edit
    @publisher = Publisher.find(params[:id])
  end
  
  def create
    @publisher = Publisher.new(params[:publisher])
    if @publisher.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    @publisher = Publisher.find(params[:id])
    if @publisher.update_attributes(params[:publisher])
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @publisher = Publisher.find(params[:id])
    @publisher.destroy
    redirect_to :action => "index"
  end  

end
