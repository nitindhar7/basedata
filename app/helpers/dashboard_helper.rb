module DashboardHelper
  
  def get_user_name(user_id)
    User.find_by_id(user_id).name
  end
  
  def get_collection_name(collection_id)
    Collection.find_by_id(collection_id).name
  end
  
  def get_days_passed(date)
    days = (Date.today - date.to_date).to_i
    
    if days == 0
      "Today"
    else
      "#{days} days ago"
    end
  end
  
  def render_error_message
    if !flash[:error].blank?
      "<div id=\"dashboard_error\">#{flash[:error]}</div>"
    end
  end
  
end
