class Admin::AuthorsController < Admin::AdminBackEndController
    
  def index
    if !params[:author_ids].nil?
      Author.destroy_all(["id in (?)", params[:author_ids]])
    end
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find(params[:id])
  end
  
  def create
    @author = Author.new(params[:author])
    if @author.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(params[:author])
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to :action => "index"
  end 
  
end
