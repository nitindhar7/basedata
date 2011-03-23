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
    @collection.account_id = session[:account].id

    respond_to do |format|
      if @collection.save
        save_activity(@collection, "created collection")
        
        flash[:notice] = "Collection #{@collection.name} was successfully created."
        format.html { redirect_to(dashboard_path) }
        format.xml  { render :xml => @collection, :status => :created, :location => @collection }
      else
        flash[:error] = "Collection #{@collection.name} was not created."
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
        save_activity(@collection, "updated collection")
        
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

    save_activity(@collection, "deleted collection")
    
    @collection.destroy

    respond_to do |format|
      format.html { redirect_to(dashboard_path) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def save_activity(collection, message)
    @activity = Activity.new
    @activity.collection_id = collection.id
    @activity.account_id = session[:account].id
    @activity.user_name = session[:account].name
    @activity.collection_name = collection.name
    @activity.action_taken = message
    @activity.save
  end
  
end