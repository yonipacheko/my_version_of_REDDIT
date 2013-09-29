module ApplicationHelper

  def fix_url(url)

   # url.match('^http://') ? url : "http://#{url}"
   url.start_with?('http') ? url : "http://#{url}"
  end

  def pretty_date(dt)

    dt = dt.in_time_zone(current_user.time_zone) || Time.zone.name if logged_in?

    dt.strftime("%b %d, %Y %l:%M%P %Z")

  end


  def default_time_zone
    logged_in? && !current_user.time_zone.nil? ? current_user.time_zone : Time.zone.name
    #binding.pry

  end
end
