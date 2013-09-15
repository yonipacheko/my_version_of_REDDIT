module ApplicationHelper

  def fix_url(url)

   # url.match('^http://') ? url : "http://#{url}"
   url.start_with?('http') ? url : "http://#{url}"
  end

  def pretty_date(dt)
    dt.strftime("%b %d, %Y %l:%M%P %Z")

  end
end
