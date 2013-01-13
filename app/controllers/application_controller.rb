class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include RequestsHelper

before_filter :set_access_control_headers
#TODO Verify necessity of this / vs. security issues
	def set_access_control_headers
	  headers['Access-Control-Allow-Origin'] = '*'
	  headers['Access-Control-Request-Method'] = '*'
	end

end
