class DashboardController < ApplicationController
  
  def welcome
  end
  
  def index
    @collections = Collection.find(:all, :conditions => {:account_id => session[:user].account_id}, :order => "created_at DESC")
    @activities = Activity.paginate(:all, :conditions => {:account_id => session[:user].account_id}, :limit => 9, :order => "created_at DESC", :page => params[:page])
  end
end