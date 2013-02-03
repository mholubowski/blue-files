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
			redirect_to new_password_reset_path, :alert => "Password &crarr; 
			reset has expired, please request again."
		elsif @Account.update_attributes(params[:Account])
			redirect_to root_url, :notice => "Password has been reset."
		else
			render :edit
		end
	end

end
