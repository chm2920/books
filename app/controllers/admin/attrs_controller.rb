class Admin::AttrsController < Admin::AdminBackEndController
    
  def index
    if !params[:attr_ids].nil?
      Attr.destroy_all(["id in (?)", params[:attr_ids]])
    end
    @attrs = Attr.all
  end

  def new
    @attr = Attr.new
  end

  def edit
    @attr = Attr.find(params[:id])
  end
  
  def create
    @attr = Attr.new(params[:attr])
    if @attr.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    @attr = Attr.find(params[:id])
    if @attr.update_attributes(params[:attr])
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @attr = Attr.find(params[:id])
    @attr.destroy
    redirect_to :action => "index"
  end  

end
