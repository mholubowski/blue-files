module SessionsHelper

	def sign_in(account)
		cookies[:remember_token] = { value: account.remember_token,
									 expires: 1.day.from_now }
									 #TODO notify users of time-out
	end

	def sign_in_admin(account)
		cookies[:remember_token_admin] = { value: account.remember_token,
									 	   expires: 1.hour.from_now }
									 	   #TODO notify users of time-out
	end

	def admin?
		cookies[:remember_token_admin] == current_account.remember_token if signed_in?
	end

	def signed_in?
		!current_account.nil?
	end

	def sign_out
		self.current_account = nil
		cookies.delete(:remember_token)
		cookies.delete(:remember_token_admin)
	end

	def current_account
		@current_accout ||= Account.find_by_remember_token(cookies[:remember_token])
	end

	def current_account=(account)
		@current_account = account
	end

end
