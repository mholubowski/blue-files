class RequestsController < ApplicationController

	def index
		 @recent_requests = current_account.requests.all
	end

	def show
	end
	def new
		@request = current_account.requests.build if signed_in?
	end

	def create
		@request = current_account.requests.build(params[:request])
		if @request.save
			respond_to do |format|
				format.html do    
					flash[:success] = "Successful request posted!"
					redirect_to root_path
				end
        # format.js
	    	end
		else
			flash.now[:error] = "Please try again"
			render 'new'
		end
	end

	def edit
	end

	def destroy
	end

end
 