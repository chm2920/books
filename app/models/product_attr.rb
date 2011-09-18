class ProductAttr < ActiveRecord::Base
  
  belongs_to :product
  belongs_to :attr
  
end
