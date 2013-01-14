class SessionsController < ApplicationController
  def new
  end

  def create
  	account = Account.find_by_username(params[:session][:username])
    admin_entry = params[:session][:account_admin_password]
    admin_pass  = account.account_admin_password if account

  	if account && account.authenticate(params[:session][:password]) && admin_entry.blank?
  		flash[:success] = "Successfully Signed In!"
  		sign_in(account)
  		redirect_back_or root_url

    elsif account && account.authenticate(params[:session][:password]) && admin_entry == admin_pass
      flash[:success] = "Successfully signed in as Admin!"
      sign_in(account)
      sign_in_admin(account)
      redirect_back_or root_url
      
  	else
  		flash[:error] = "Invalid Password and Username" if admin_entry.blank?
      flash[:error] = "Invalid Password and Username (Check admin password)" unless admin_entry.blank?
  		redirect_to signin_path
  	end
  end

  def destroy
  	sign_out
  	redirect_to root_url
  end
end
