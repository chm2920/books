class ProductsController < ApplicationController
  
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
  
  def publish
    @publish = Publish.find(params[:id])
    @ps = Product.paginate :page => params[:page], :per_page => 20, :conditions => ["publish_id = ?", @publish.id], :order => "id desc"
  end
  
  def author
    @author = Author.find(params[:id])
    @ps = Product.paginate :page => params[:page], :per_page => 20, :conditions => ["author_id = ?", @author.id], :order => "id desc"
  end
  
  def show
    @product = Product.find(params[:id])
    @props = ProductProp.all
    @property = Hash.from_xml(@product.property)["hash"]
    @category = @product.category
    @node = @category.node
  end
  
private
  
  def find_side_data
    @publishes = Publish.all
    @authors = Author.all
  end
  
end
