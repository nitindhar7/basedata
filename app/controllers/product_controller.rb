class ProductController < ApplicationController
  
  def index
    @collection_id = params[:collection_id]
    @query = params[:query].gsub('Results for ', '').gsub(/["\n\t]/, '')
    @mpn = params[:mpn]
    @price = params[:price].gsub(/[^\d\.]/, '')
    @currency = params[:price].gsub(/[^a-zA-Z]/, '')
    @seller = params[:seller]
    @condition = params[:condition]
    @brand = params[:brand]
    @upc = params[:upc]
    @ean = params[:ean]
    @model_number = params[:model_number]
    @type = params[:type]
    @url = params[:url]
    @image_url = params[:image_url]
    @country = params[:country]
    @expiration = params[:expiration]

    @product = Product.new
    @product.collection_id = @collection_id
    @product.mpn = @mpn
    @product.price = @price
    @product.currency = @currency
    @product.seller = @seller
    @product.condition = @condition
    @product.brand = @brand
    @product.upc = @upc
    @product.ean = @ean
    @product.model_number = @model_number
    @product.product_type = @type
    @product.url = @url
    @product.image_url = @image_url
    @product.country = @country
    @product.expiration = @expiration
    @product.save
    
    render :nothing => true
  end
  
  def export_collection
    @products = Product.find(:all, :conditions => {:collection_id => params[:collection_id]})
    
    if @products.length > 0
      collection_export_path = "tmp/collection_#{params[:collection_id]}_export.xml"
      
      File.open(Rails.root.join(collection_export_path), 'w') {|f| f.write(@products.to_xml) }
      send_file collection_export_path
    else
      flash[:error] = "Collection is empty. Nothing to export!"
      redirect_to(collection_path(params[:collection_id]))
    end
  end

end