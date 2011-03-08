class AccountsController < ApplicationController

  # GET /accounts
  # GET /accounts.xml
  def index
  end

  # GET /accounts/1
  # GET /accounts/1.xml
  def show
    @account = Account.find(params[:id])
    @products = Product.find(:all, :conditions => {:account_id => @account.id})

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

    @account.phone.gsub(/[^0-9]/, '')

    respond_to do |format|
      if @account.save && confirm_password == @account.password
        @user = User.new
        @user.name = "#{@account.first_name} #{@account.last_name}"
        @user.email = @account.email
        @user.password = @account.password
        @user.autosave = 0
        @user.role = 'owner'
        @user.account_id = @account.id
        @user.save
        
        session[:user] = @user
        flash[:notice] = "Account was successfully created."
        
        format.html { redirect_to(:controller => "dashboard", :action => "index") }
        format.xml  { render :xml => @account, :status => :created, :location => @account }
      else
        @account.password = nil
        
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
        @activity = Activity.new
        @activity.user_id = session[:user].id
        @activity.account_id = @account.id
        @activity.action_taken = "updated account"
        @activity.save
        
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

    @activity = Activity.new
    @activity.user_id = session[:user].id
    @activity.account_id = params[:id]
    @activity.action_taken = "deleted account"
    @activity.save

    respond_to do |format|
      format.html { redirect_to(accounts_url) }
      format.xml  { head :ok }
    end
  end
  
end