#-*- coding: utf-8 -*-
require 'cgi'

def parse(page_source)
  datas = page_source.scan(%r!(\d+)年 ?(\d+)月 ?(\d+)日<br />!)
  url_titles = page_source.scan(%r!^<a href="(.+?)">(.+?)</a><br />!)
  url_titles.zip(datas).map{
    |(aurl,atitle),
    ymd|
    [
      CGI.unescapeHTML(aurl),
      CGI.unescapeHTML(atitle),
      Time.local(*ymd)
    ]
  }
end

x = parse(open("samplepage.html",&:read))
puts x[0,2]