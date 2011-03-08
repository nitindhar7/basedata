class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  #protect_from_forgery :secret => '8c3e099237e6366fd2f5366e9c430e79'
  
  require 'simple-rss'
  require 'open-uri'
  require 'net/http'
  require 'rubygems'
  require 'xmlsimple'

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
