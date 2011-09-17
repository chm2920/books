#encoding: utf-8
module ApplicationHelper
  
  def show_price(num)
    if num
      "￥" + "%.2f" % num
    else
      "未标价"
    end
  end
  
  def show_price_f(num)
    if num
     "￥" + "%.2f" % num + " 元" 
   else
     "未标价"
   end
  end
  
end
