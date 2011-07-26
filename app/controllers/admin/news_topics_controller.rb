class Admin::NewsTopicsController < Admin::AdminBackEndController
    
  def index
    if !params[:news_topic_ids].nil?
      NewsTopic.destroy_all(["id in (?)", params[:news_topic_ids]])
    end
    @news_topics = NewsTopic.paginate :page => params[:page], :per_page => 15, :order => "created_at desc"
  end

  def new
    @news_categories = NewsCategory.all
    @news_topic = NewsTopic.new
  end

  def edit
    @news_categories = NewsCategory.all
    @news_topic = NewsTopic.find(params[:id])
  end
  
  def create
    @news_topic = NewsTopic.new(params[:news_topic])
    if @news_topic.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    @news_topic = NewsTopic.find(params[:id])
    if @news_topic.update_attributes(params[:news_topic])
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @news_topic = NewsTopic.find(params[:id])
    @news_topic.destroy
    redirect_to :action => "index"
  end
  
end
