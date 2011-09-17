class Product < ActiveRecord::Base
  
  belongs_to :node
  belongs_to :category
  
  has_many :cart_items
  has_many :order_items
  
  has_attached_file :image,
    :styles => {  
      :big => {
        :geometry => ''
      },
      :original => {  
        :geometry => '200x200#'
      }
    },
    :url => "/uploads/:class/:attachment/:id_:style.jpg",
    :path => ":rails_root/public/uploads/:class/:attachment/:id_:style.jpg"
    
  def self.new_ps
    find(:all, :limit => 10, :order => "id desc")
  end
  
  def self.re_ps
    find(:all, :limit => 10, :order => "id desc")
  end
  
  def image_path
    # spic mpic lpic
    self.image_file_name.gsub('spic', 'lpic')
  end
  
  def show_url
    "/p/#{self.id}"
  end
  
end
