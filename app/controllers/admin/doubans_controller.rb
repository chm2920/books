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
      author = item["author"]
      attributes = item["attribute"]      
      rating = item["rating"]["average"]
      numRaters = item["rating"]["numRaters"]
      @doubans << Douban.create(
        :dou_id => douban_id,
        :title => title,
        :img => image,
        :author => author,
        :attributes => attributes,
        :rating => rating,
        :numRaters => numRaters
      )
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
      url = "http://api.douban.com/book/subjects?tag=#{@tag}&start-index=1&max-results=50&apikey=#{api_key}"
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
    require 'cgi'
    require 'open-uri' 
    private_key = "3b2c489f9b1c2c16"
    api_key = "0595dd1222426c6510c1973666c7452f"
    url = "http://api.douban.com/book/subject/#{douid}" 
    @gets = open(url).read
    @hsh = Hash.from_xml(@gets)
    @entry = @hsh["entry"]
    @douban = Douban.new
    @douban.dou_id = @entry["id"].split("/").last
    @douban.title = @entry["title"]
    @douban.img = @entry["link"][2]["href"]
    @douban.summary = @entry["summary"]
    @douban.author = @entry["author"]
    @douban.attrs = @entry["attribute"]
    @douban.tag = @entry["tag"]
    @douban.rating = @entry["rating"]["average"]
    @douban.numRaters = @entry["rating"]["numRaters"]
  end
  
  def save_product
    render :text => "ok"
  end
  
end
