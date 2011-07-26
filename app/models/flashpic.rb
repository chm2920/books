class Flashpic < ActiveRecord::Base
  
  has_attached_file :image,
    :styles => {  
      :original => {  
        :geometry => '398x250#'
      }
    },
    :url => "/uploads/:class/:attachment/:id_:style.jpg",
    :path => ":rails_root/public/uploads/:class/:attachment/:id_:style.jpg"
    
end
