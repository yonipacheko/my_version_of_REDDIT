module ApplicationHelper

  def fix_url(url)

   # url.match('^http://') ? url : "http://#{url}"
   url.start_with?('http') ? url : "http://#{url}"
  end
end
