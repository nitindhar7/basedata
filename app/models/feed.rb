require 'uri'

class Feed
  attr_accessor :link, :feed, :page, :query, :price_low, :price_high, :seller, :condition, :brand, :page, :max_results, :start_index, :total_pages, :total_results
  
  def initialize
    @link = "http://www.google.com/base/feeds/snippets/-/products?"
    @max_results = 100
  end
  
  def refine_options(params)
    @query = refine(params[:query])
    @price_low = refine(params[:price_low])
    @price_high = refine(params[:price_high])
    @seller = refine(params[:seller])
    @condition = refine(params[:condition])
    @brand = refine(params[:brand])
    @page = params[:page] || 1
    @start_index = ( ( @page.to_i - 1 ) * @max_results + 1 )
  end
  
  def build
    @link += "max-results=#{@max_results}&start-index=#{@start_index}&bq=#{'"' + @query + '"'}"
  end
  
  def filter
    @link += " [price:#{@price_low}..#{@price_high} USD]" unless (@price_low.blank? || @price_high.blank?)
    @link += " [author:#{@seller}]"                       unless @seller.blank?
    @link += " [condition:#{@condition}]"                 unless @condition.blank?
    @link += " [brand:#{@brand}]"                         unless @brand.blank?
    @link = URI.escape(@link)
  end
  
  def load
    xml_data = Net::HTTP.get_response(URI.parse(@link)).body
    @feed = XmlSimple.xml_in(xml_data, {'KeyAttr' => 'name'})
    @total_results = @feed["totalResults"].first.to_i
    @total_pages = (@total_results / @max_results) + 1
  end
  
  private
  
  def refine(param)
    begin
      param.strip
    rescue
      param
    end
  end
end