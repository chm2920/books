class Admin::ProductsController < Admin::AdminBackEndController
    
  def index
    if !params[:product_ids].nil?
      Product.destroy_all(["id in (?)", params[:product_ids]])
    end
    @products = Product.paginate :page => params[:page], :per_page => 15, :order => "created_at desc"
  end

  def new
    @nodes = Node.all
    @authors = Author.all
    @publishes = Publish.all
    @props = ProductProp.all
    @product = Product.new
  end

  def edit
    @nodes = Node.all
    @authors = Author.all
    @publishes = Publish.all
    @props = ProductProp.all
    @product = Product.find(params[:id])
    @prop_hash = Hash.from_xml(@product.property)["hash"]
  end
  
  def create
    @product = Product.new(params[:product])
    @product.node_id = Category.find(params[:product][:category_id])
    @product.property = params[:property].to_xml
    if @product.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.node_id = Category.find(params[:product][:category_id])
    @product.property = params[:property].to_xml
    if @product.update_attributes(params[:product])
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to :action => "index"
  end
  
end
