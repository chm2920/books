#encoding: utf-8
class Attr < ActiveRecord::Base
  
  has_many :product_attrs
  
  ATTRNAME = {
    "author" => "作者",
    "translator" => "注",
    "publisher" => "出版社",
    "pubdate" => "出版日期",
    "binding" => "装订",
    "pages" => "页数",
    "isbn10" => "isbn10",
    "isbn13" => "isbn13"
  }
  
  def attr_name
    ATTRNAME[self.name]
  end
  
  def product_val(pid)
    arr = Attr.find_by_sql("select val from product_attrs where product_id = #{pid} and attr_id = #{self.id}")
    if arr.length>0
      arr.first.val.gsub("###", " ")
    else
      nil
    end
  end
  
end
