require 'digest/sha1'

class UsersController < ApplicationController

  # GET /users
  # GET /users.xml
  def index
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    @account = Account.find(@user.account_id)
    @members = User.find(:all, :conditions => {:account_id => @account.id})

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    @user.password = Digest::SHA1.hexdigest(@user.password)

    respond_to do |format|
      if @user.save
        flash[:notice] = "User #{@user.name} was successfully created."
        format.html { redirect_to(:action => :index) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = "User #{@user.name} was successfully updated."
        format.html { redirect_to(:action=>:index) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
  def signin
    @email = params[:email]
    @password = Digest::SHA1.hexdigest(params[:password])
    
    @user = User.find(:first, :conditions => {:email => @email, :password => @password})

    if !@user.blank?
      flash[:notify] = ""
      session[:user] = @user
      redirect_to(:controller => "dashboard", :action => "index")
    else
      reset_session
      flash[:error] = "Invalid ID or password. Please try again."
      redirect_to(:action => :index)
    end
  end
  
  def signout
    reset_session
    redirect_to(:controller => "users", :action => "index")
  end
end