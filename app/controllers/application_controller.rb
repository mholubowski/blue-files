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

	  private
    def mobile_device?
      request.user_agent =~ /Mobile|webOS/
    end
    def iphone?
    	request.user_agent =~ /iPhone/ && mobile_device?
    end

    helper_method :mobile_device?

end
