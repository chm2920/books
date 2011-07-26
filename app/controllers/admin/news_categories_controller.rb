class Admin::NewsCategoriesController < Admin::AdminBackEndController
    
  def index
    if !params[:news_category_ids].nil?
      NewsCategory.destroy_all(["id in (?)", params[:news_category_ids]])
    end
    @news_categories = NewsCategory.all
  end

  def new
    @news_category = NewsCategory.new
  end

  def edit
    @news_category = NewsCategory.find(params[:id])
  end
  
  def create
    @news_category = NewsCategory.new(params[:news_category])
    if @news_category.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    @news_category = NewsCategory.find(params[:id])
    if @news_category.update_attributes(params[:news_category])
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @news_category = NewsCategory.find(params[:id])
    @news_category.destroy
    redirect_to :action => "index"
  end
  
end
