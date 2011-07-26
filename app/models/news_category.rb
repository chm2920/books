class NewsCategory < ActiveRecord::Base
  
  has_many :news_topics
  
end
