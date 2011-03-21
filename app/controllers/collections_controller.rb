class CollectionsController < ApplicationController
  
  # GET /collections
  # GET /collections.xml
  def index
  end

  # GET /collections/1
  # GET /collections/1.xml
  def show
    @collection = Collection.find(params[:id])
    @products = Product.find(:all, :conditions => {:collection_id => @collection.id})
    
    @columns = Product.column_names
    @columns.delete("id")
    @columns.delete("upc")
    @columns.delete("ean")
    @columns.delete("model_number")
    @columns.delete("product_type")
    @columns.delete("url")
    @columns.delete("image_url")
    @columns.delete("country")
    @columns.delete("expiration")
    @columns.delete("collection_id")
    @columns.delete("created_at")
    @columns.delete("updated_at")

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @collection }
    end
  end

  # GET /collections/new
  # GET /collections/new.xml
  def new
    @collection = Collection.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @collection }
    end
  end

  # POST /collections
  # POST /collections.xml
  def create
    @collection = Collection.new(params[:collection])
    @collection.user_id = session[:user].id
    @collection.account_id = session[:user].account_id

    respond_to do |format|
      if @collection.save
        @activity = Activity.new
        @activity.user_id = session[:user].id
        @activity.collection_id = @collection.id
        @activity.account_id = session[:user].account_id
        @activity.user_name = session[:user].name
        @activity.collection_name = @collection.name
        @activity.action_taken = "created collection"
        @activity.save
        
        flash[:notice] = "Collection #{@collection.name} was successfully created."
        format.html { redirect_to(dashboard_path) }
        format.xml  { render :xml => @collection, :status => :created, :location => @collection }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @collection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /collections/1/edit
  def edit
    @collection = Collection.find(params[:id])
  end

  # PUT /collections/1
  # PUT /collections/1.xml
  def update
    @collection = Collection.find(params[:id])

    respond_to do |format|
      if @collection.update_attributes(params[:collection])
        @activity = Activity.new
        @activity.user_id = session[:user].id
        @activity.collection_id = @collection.id
        @activity.account_id = session[:user].account_id
        @activity.user_name = session[:user].name
        @activity.collection_name = @collection.name
        @activity.action_taken = "updated collection"
        @activity.save
        
        flash[:notice] = "Collection #{@collection.name} was successfully updated."
        format.html { redirect_to(:action=>:show, :id => @collection) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @collection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.xml
  def destroy
    @collection = Collection.find(params[:id])

    Product.delete_all(:collection_id => @collection.id)

    @activity = Activity.new
    @activity.user_id = session[:user].id
    @activity.collection_id = @collection.id
    @activity.account_id = session[:user].account_id
    @activity.user_name = session[:user].name
    @activity.collection_name = @collection.name
    @activity.action_taken = "deleted collection"
    @activity.save
    
    @collection.destroy

    respond_to do |format|
      format.html { redirect_to(dashboard_path) }
      format.xml  { head :ok }
    end
  end
  
end