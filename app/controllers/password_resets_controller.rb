class PasswordResetsController < ApplicationController

	def new
	end

	def create
		account = Account.find_by_admin_email(params[:email].downcase)
		account.send_password_reset if account
		redirect_to root_url, :notice => "Email sent with password reset instructions."
	end

	def edit
		@Account = Account.find_by_password_reset_token!(params[:id])
	end

	def update
		@Account = Account.find_by_password_reset_token!(params[:id])
		if @Account.password_reset_sent_at < 2.hours.ago
			flash[:error] = "Password reset has expired, please request again."
			redirect_to new_password_reset_path 
		elsif @Account.update_attributes(params[:account])
			flash[:notice] = "Password has been reset."
			redirect_to root_url
		else
			flash.now[:notice] = "Else"
			render :edit
		end
	end

end
