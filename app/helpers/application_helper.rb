module ApplicationHelper
  
  ########################################################################
  # CONDITIONAL MESSAGES                                                 #
  ########################################################################
  
  def get_nav_hightlight(section)
    if @controller.controller_name == section
      "active_nav_tab"
    end
  end
  
  def get_company_name(account_id)
    Account.find(account_id).company
  end
  
  ########################################################################
  # RENDERERS                                                            #
  ########################################################################
  
  def render_collections_list_placeholder
    "<span>No Collections Yet</span>" if @collections.length == 0
  end
  
  def render_activities_list_placeholder
    "<div id=\"activity_summary_empty\">No Activities Yet</div>" if @activities.length == 0
  end
  
  def render_trends_list_placeholder
    "<div id=\"trend_summary_empty\">No Trends Yet</div>" #if @trends.length == 0
  end
  
  def render_empty_collection_label
    "<div id=\"collection_data_empty\">No Data</div>" if @products.length == 0
  end
  
end