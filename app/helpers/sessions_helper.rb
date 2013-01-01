module SessionsHelper

	def sign_in(account)
		cookies[:remember_token] = { value: account.remember_token,
									 expires: 1.day.from_now }
	end

	def signed_in?
		!current_account.nil?
	end

	def sign_out
		self.current_account = nil
		cookies.delete(:remember_token)
	end

	def current_account
		@current_accout ||= Account.find_by_remember_token(cookies[:remember_token])
	end

	def current_account=(account)
		@current_account = account
	end

end
