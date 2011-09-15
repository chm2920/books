# coding: utf-8  

require 'open-uri'
require 'iconv'
require 'cgi'

desc "get_douban from_web"
task(:get_douban => :environment) do
  private_key = "3b2c489f9b1c2c16"
  api_key = "0595dd1222426c6510c1973666c7452f"

  tag = "国学"
  tag = CGI::escape(tag)
  url = "http://api.douban.com/book/subjects?tag=#{tag}&start-index=1&max-results=50&apikey=#{api_key}"  
  gets = open(url).read
  hsh = Hash.from_xml(gets)
  feed = hsh["feed"]
  entry = feed["entry"]
  
  for item in entry
    douban_id = item["id"].split("/").last
    title = item["title"]
    category = item["category"]
    image = item["link"][2]["href"]
    
    isbn10 = item["attribute"][0]
    isbn13 = item["attribute"][1]
    author = item["attribute"][2]
    price = item["attribute"][3]
    publisher = item["attribute"][4]
    pubdate = item["attribute"][5]
    
    rating = item["rating"]["average"]
    numRaters = item["rating"]["numRaters"]
    Douban.create(
      :dou_id => douban_id,
      :title => title,
      :category => category,
      :author => author,
      :img => image,
      :isbn10 => isbn10,
      :isbn13 => isbn13,
      :price => price,
      :publisher => publisher,
      :pubdate => pubdate,
      :rating => rating,
      :numRaters => numRaters
    )
  end
  
  # for t in entry[0].keys
    # puts t
  # end
  
  # puts feed["totalResults"]
  # puts feed["itemsPerPage"]
  # puts feed["entry"].length
end


__END__
