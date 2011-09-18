class PublisherProduct < ActiveRecord::Base
  
  belongs_to :publisher
  belongs_to :product
  
end
