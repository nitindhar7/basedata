module SearchHelper
  def pager(data)
    left = ''
    right = ''
    page = data.page.to_i
    
    opts = {
      :controller => "search",
      :action => "index",
      :query => data.query,
      :price_low => data.price_low,
      :price_high => data.price_high,
      :seller => data.seller,
      :conditions => data.condition,
      :brand => data.brand,
      :start_index => data.start_index
    }

    if page == 1
      left_opts = opts
      right_opts = opts.merge({ :page => page+1 })
    elsif page > 1
      left_opts = opts.merge({ :page => page-1, :start_index => ((page-2)*250+1) })
      right_opts = opts.merge({ :page => page+1 })
    end
    
    left = link_to "◄", left_opts, :id => "search_page_left"
    right = link_to "►", right_opts, :id => "search_page_right"

    return right+left
  end
end