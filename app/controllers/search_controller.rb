class SearchController < ApplicationController
  def index
    if params[:query].blank?
      redirect_to_page("To search, please enter what you are looking for in the search field.")
      return
    end

    Search.create(:query => params[:query], :account_id => session[:account].id)

    @data = Feed.new
    @data.refine_options(params)
    @data.build
    @data.filter
    @data.load

    if @data.total_results == 0
      redirect_to_page("No results found. Try modifying your search.")
    else
      @collections = Collection.find(:all)
      @query = @data.query
    end
  end

  private
  
  def redirect_to_page(message)
    flash[:error] = message
    redirect_to(dashboard_path)
  end
end