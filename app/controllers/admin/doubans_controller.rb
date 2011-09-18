class Admin::DoubansController < Admin::AdminBackEndController
    
  def index
    if !params[:douban_ids].nil?
      Douban.destroy_all(["id in (?)", params[:douban_ids]])
    end
    @doubans = Douban.paginate :page => params[:page], :per_page => 20, :order => 'id desc'
  end

  def new
    @douban = Douban.new
  end

  def edit
    @douban = Douban.find(params[:id])
  end
  
  def create
    @douban = Douban.new(params[:douban])
    if @douban.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    @douban = Douban.find(params[:id])
    if @douban.update_attributes(params[:douban])
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @douban = Douban.find(params[:id])
    @douban.destroy
    redirect_to :action => "index"
  end
  
  def get_douban(url)
    @doubans = []
    require 'cgi'
    require 'open-uri'  
    gets = open(url).read
    hsh = Hash.from_xml(gets)
    feed = hsh["feed"]
    entry = feed["entry"]
    for item in entry
      douban_id = item["id"].split("/").last
      title = item["title"]
      image = item["link"][2]["href"]
      arr = []
      if item["author"]
        if item["author"].length > 1
          for t in item["author"]
            arr << t["name"]
          end
        else
          arr << item["author"]["name"]
        end
      end
      author = arr.join("###")
      rating = item["rating"]["average"]
      numRaters = item["rating"]["numRaters"]
      if !Douban.find_by_dou_id(douban_id)
        @doubans << Douban.create(
          :dou_id => douban_id,
          :title => title,
          :img => image,
          :author => author,
          :rating => rating,
          :numRaters => numRaters
        )
      end
    end
    @doubans
  end
  
  def tag
    case request.method
    when "POST"
      @tag = params[:tag]
      @tag = CGI::escape(@tag)
      private_key = "3b2c489f9b1c2c16"
      api_key = "0595dd1222426c6510c1973666c7452f"
      url = "http://api.douban.com/book/subjects?tag=#{@tag}&start-index=50&max-results=50&apikey=#{api_key}"
      @doubans = get_douban(url)
      render :list
    end
  end
  
  def q
    case request.method
    when "POST"
      @q = params[:q]
      @q = CGI::escape(@q)
      private_key = "3b2c489f9b1c2c16"
      api_key = "0595dd1222426c6510c1973666c7452f"
      url = "http://api.douban.com/book/subjects?q=#{@q}&start-index=1&max-results=50&apikey=#{api_key}"
      @doubans = get_douban(url)
      render :list
    end
  end
  
  def douid
  end
  
  def item
    @douid = params[:douid] || params[:id]
    get_item(@douid)
  end
  
  def get_item(douid)
    @douban = Douban.find_by_dou_id(douid)
    if !@douban.nil?
      if @douban.gets
        @gets = @douban.gets
        puts "get from database"
      else
        require 'cgi'
        require 'open-uri' 
        private_key = "3b2c489f9b1c2c16"
        api_key = "0595dd1222426c6510c1973666c7452f"
        url = "http://api.douban.com/book/subject/#{douid}" 
        @gets = open(url).read
        @douban.gets = @gets
        @douban.save
        puts "get from url"
      end      
    else
      require 'cgi'
      require 'open-uri' 
      private_key = "3b2c489f9b1c2c16"
      api_key = "0595dd1222426c6510c1973666c7452f"
      url = "http://api.douban.com/book/subject/#{douid}" 
      @gets = open(url).read
    end
    
    @hsh = Hash.from_xml(@gets)
    @entry = @hsh["entry"]
    @douban = Douban.new
    @douban.dou_id = @entry["id"].split("/").last
    @douban.title = @entry["title"]
    @douban.img = @entry["link"][2]["href"]
    @douban.summary = @entry["summary"]
    @douban.rating = @entry["rating"]["average"]
    @douban.numRaters = @entry["rating"]["numRaters"]
    
    @price = ""
    @gets.scan(/<db:attribute name="price">(.*?)<\/db/m) do |p|
      @price = p[0].to_s
    end
    @publisher = ""
    @gets.scan(/<db:attribute name="publisher">(.*?)<\/db/m) do |p|
      @publisher = p[0].to_s
    end
    arr = []
    if @entry["author"]
      if @entry["author"].length > 1
        for t in @entry["author"]
          arr << t["name"]
        end
      else
        arr << @entry["author"]["name"]
      end
    end
    @author = arr.join("###")
    arr = []
    if @entry["tag"]
      if @entry["tag"].length > 1
        for t in @entry["tag"]
          arr << t["name"]
        end
      else
        arr << @entry["tag"]["name"]
      end
    end
    arr = []
    @gets.scan(/db:tag count="(.*?)" name="(.*?)"/) do |t, m|
      arr << m
    end
    @tag = arr.join("###")
    
    @author_intro = ""
    @gets.scan(/<db:attribute name="author-intro">(.*?)<\/db:attribute>/m) do |m|
      @author_intro = m[0].to_s
    end
    
    @attrs = Attr.all
    @product_attrs = {}
    for attr in @attrs
      @gets.scan(/<db:attribute name="#{attr.name}">(.*?)<\/db:attribute>/m) do |m|
        if @product_attrs[attr.name]
          @product_attrs[attr.name] += '###' + m[0].to_s
        else
          @product_attrs[attr.name] = m[0].to_s
        end
      end
    end
  end
  
  def save_product
    @product = Product.new(params[:product])
    @product.node_id = 1
    @product.category_id = 1
    @product.save
    if params[:re_publisher] and params[:re_publisher]!=""
      @publisher = Publisher.find_by_name(params[:re_publisher])
      if @publisher.nil?
        @publisher = Publisher.new
        @publisher.name = params[:re_publisher]
        @publisher.save
      end
      if !@publisher.products.include?(@product)
        @publisher.products << @product
      end
    end
    if params[:re_author] and params[:re_author]!=""
      authors = params[:re_author].split('###') 
      @author_intro = ""
      if params[:author_intro]
        @author_intro = params[:author_intro]
      end
      for t in authors
        @author = Author.find_by_name(t)
        if @author.nil?
          @author = Author.new
          @author.name = t
          @author.intro = @author_intro
          @author.save
        end
        if !@product.authors.include?(@author)
          @product.authors << @author
        end
      end
    end
    if params[:re_tag] and params[:re_tag]!=""
      tags = params[:re_tag].split('###')
      for t in tags
        @tag = Tag.find_by_name(t)
        if @tag.nil?
          @tag = Tag.new
          @tag.name = t
          @tag.save
        end
        if !@product.tags.include?(@tag)
          @product.tags << @tag
        end
      end
    end
    attrs = Attr.all
    for attr in attrs
      if params[attr.name.to_sym]
        ProductAttr.create(:product_id => @product.id, :attr_id => attr.id, :val => params[attr.name.to_sym])
      end
    end
    redirect_to :action => "index"   
  end
  
end
