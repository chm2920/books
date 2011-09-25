#encoding: utf-8
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
  
  def tag
    @tag = Tag.find(params[:id])
    @ps = @tag.products.paginate :page => params[:page], :per_page => 20, :order => "id desc"
  end
  
  def search
    @keyword = params[:keyword]
    @ps = Product.paginate :page => params[:page], :per_page => 2, :conditions => "title like '%#{@keyword}%'", :order => "id desc"
  end
  
  def show
    @product = Product.find(params[:id])
    @attrs = Attr.all
    @category = @product.category
    @node = @category.node
  end
  
  def add_to_cart
    @product = Product.find(params[:id])
    if @product.nil?
      redirect_back
      return
    end
    if !session[:user_id].nil?
      @user_id = session[:user_id]
    else
      @user_id = 0
    end
    @product = Product.find(params[:id])
    if !@product.nil?
      if !session[:cart_id].nil?
        @cart = Cart.find(session[:cart_id])
        if @cart.nil?
          session[:cart_id] = nil
          @cart = Cart.new
          @cart.user_id = @user_id
          @cart.save
          session[:cart_id] = @cart.id          
        end
      else
        @cart = Cart.new
        @cart.user_id = @user_id
        @cart.save
        session[:cart_id] = @cart.id
      end
      @cart_item = CartItem.new
      @cart_item.product_id = @product.id
      @cart_item.quantity = 1
      @cart.cart_items << @cart_item
      redirect_to :action => "cart"
    else
      redirect_back
    end    
  end
  
  def cart
    if !session[:cart_id].nil?
      @cart = Cart.find(session[:cart_id])
    end
  end
  
  def update_cart
    redirect_to :action => "cart"
  end
  
  def remove_item
    @cart = Cart.find(session[:cart_id])
    @cart_item = CartItem.find(params[:id])
    @cart.cart_items.delete @cart_item
    redirect_to :action => "cart"
  end
  
private
  
  def find_side_data
    @publishers = Publisher.all(:limit => 10)
    @authors = Author.all(:limit => 10)
  end
  
end
