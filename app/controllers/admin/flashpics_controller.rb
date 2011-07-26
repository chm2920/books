class Admin::FlashpicsController < Admin::AdminBackEndController
    
  def index
    if !params[:flashpic_ids].nil?
      Flashpic.destroy_all(["id in (?)", params[:flashpic_ids]])
    end
    @flashpics = Flashpic.all
  end

  def new
    @flashpic = Flashpic.new
  end

  def edit
    @flashpic = Flashpic.find(params[:id])
  end
  
  def create
    @flashpic = Flashpic.new(params[:flashpic])
    if @flashpic.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    @flashpic = Flashpic.find(params[:id])
    if @flashpic.update_attributes(params[:flashpic])
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @flashpic = Flashpic.find(params[:id])
    @flashpic.destroy
    redirect_to :action => "index"
  end
  
end
