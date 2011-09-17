class Admin::TagsController < Admin::AdminBackEndController
    
  def index
    if !params[:tag_ids].nil?
      Tag.destroy_all(["id in (?)", params[:tag_ids]])
    end
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def edit
    @tag = Tag.find(params[:id])
  end
  
  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update_attributes(params[:tag])
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to :action => "index"
  end  

end
