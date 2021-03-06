require 'digest/sha1'

class AccountsController < ApplicationController

  # GET /accounts
  # GET /accounts.xml
  def index
  end

  # GET /accounts/1
  # GET /accounts/1.xml
  def show
    @account = Account.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.xml
  def new
    @account = Account.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @account }
    end
  end

  # POST /accounts
  # POST /accounts.xml
  def create
    @account = Account.new(params[:account])
    @account.password = Digest::SHA1.hexdigest(@account.password)
    confirm_password = Digest::SHA1.hexdigest(@account.confirm_password)

    respond_to do |format|
      if @account.save && confirm_password == @account.password
        session[:account] = @account
        flash[:notice] = "Account was successfully created."
        format.html { redirect_to(dashboard_path) }
        format.xml  { render :xml => @account, :status => :created, :location => @account }
      else
        @account.password = nil
        @account.confirm_password = nil
        flash[:error] = "Account could not be created. Please make sure all fields are filled out."
        format.html { render :action => "new" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
  end

  # PUT /accounts/1
  # PUT /accounts/1.xml
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        
        update_password if !params[:old_password].blank?
        
        save_activity(@account.id)
        
        flash[:notice] = "Account #{@account.name} was successfully updated."
        format.html { redirect_to(:action=>:show, :id => @account) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.xml
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to(accounts_url) }
      format.xml  { head :ok }
    end
  end
  
  def signin
    @email = params[:email]
    @password = Digest::SHA1.hexdigest(params[:password])
    
    @account = Account.find(:first, :conditions => {:email => @email, :password => @password})

    if !@account.blank?
      flash[:notify] = ""
      session[:account] = @account
      redirect_to(dashboard_path)
    else
      reset_session
      flash[:error] = "Invalid ID or password. Please try again."
      redirect_to(accounts_path)
    end
  end
  
  def signout
    reset_session
    redirect_to(accounts_path)
  end
  
  private
  
  def reset_session
    session[:account] = nil
  end
  
  def save_activity(account_id)
    @activity = Activity.new
    @activity.account_id = account_id
    @activity.user_name = session[:account].name
    @activity.action_taken = "updated account"
    @activity.save
  end
  
  def update_password
    @old_password = Digest::SHA1.hexdigest(params[:old_password])
    @new_password = params[:new_password]
    @confirm_password = params[:confirm_password]
    
    if @new_password.blank? || @confirm_password.blank?
      #
    elsif @new_password != @confirm_password
      #
    elsif @old_password != session[:account].password
      #
    else
      Account.update(session[:account].id, { :password => Digest::SHA1.hexdigest(@new_password) })
    end
  end
  
end