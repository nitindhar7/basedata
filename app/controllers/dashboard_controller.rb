class DashboardController < ApplicationController
  
  def welcome
  end
  
  def index
    @collections = Collection.find(:all, :conditions => {:account_id => session[:account].id}, :order => "created_at DESC")
    @activities = Activity.paginate(:all, :conditions => {:account_id => session[:account].id}, :limit => 9, :order => "created_at DESC", :page => params[:page])
  end
end