class Admin::ProductPropsController < Admin::AdminBackEndController
    
  def index
    if !params[:product_prop_ids].nil?
      ProductProp.destroy_all(["id in (?)", params[:product_prop_ids]])
    end
    @product_props = ProductProp.all
  end

  def new
    @product_prop = ProductProp.new
  end

  def edit
    @product_prop = ProductProp.find(params[:id])
  end
  
  def create
    @product_prop = ProductProp.new(params[:product_prop])
    if @product_prop.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    @product_prop = ProductProp.find(params[:id])
    if @product_prop.update_attributes(params[:product_prop])
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @product_prop = ProductProp.find(params[:id])
    @product_prop.destroy
    redirect_to :action => "index"
  end
  
end
