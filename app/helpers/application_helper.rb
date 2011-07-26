#encoding: utf-8
module ApplicationHelper
  
  def show_price(num)
   "￥" + "%.2f" % num
  end
  
  def show_price_f(num)
   "￥" + "%.2f" % num + " 元" 
  end
  
end
