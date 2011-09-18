class ProductsController < BaseController
  
  before_filter :find_side_data
  
  def node
    @node = Node.find_by_alias(params[:id])
    @ps = Product.paginate :page => params[:page], :per_page => 20, :conditions => ["node_id = ?", @node.id], :order => "id desc"
  end
  
  def category
    @category = Category.find(params[:id])
    @node = @category.node
    @ps = Product.paginate :page => params[:page], :per_page => 20, :conditions => ["category_id = ?", @category.id], :order => "id desc"
  end
  
  def publisher
    @publisher = Publisher.find(params[:id])
    @ps = @publisher.products.paginate :page => params[:page], :per_page => 20, :order => "id desc"
  end
  
  def author
    @author = Author.find(params[:id])
    @ps = @author.products.paginate :page => params[:page], :per_page => 20, :order => "id desc"
  end
  
  def show
    @product = Product.find(params[:id])
    @attrs = Attr.all
    @category = @product.category
    @node = @category.node
  end
  
private
  
  def find_side_data
    @publishers = Publisher.all(:limit => 10)
    @authors = Author.all(:limit => 10)
  end
  
end
