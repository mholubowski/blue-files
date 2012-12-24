class SessionsController < ApplicationController
  def new
  end

  def create
  	account = Account.find_by_username(params[:session][:username])
  	puts account
  	if account && account.authenticate(params[:session][:password])
  		flash[:success] = "success"
  		#TODO Signin account
  		sign_in(account)
  		redirect_to root_url
  		#TODO redirect to account page
  	else
  		flash[:error] = "error"
  		redirect_to signin_path
  	end
  end

  def destroy
  end
end
