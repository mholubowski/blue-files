module SessionsHelper

	def sign_in(account)
		cookies[:remember_token] = { value: account.remember_token,
									 expires: 1.day.from_now }
	end

	def signed_in?
		
	end

	def sign_out

	end

	def current_account
		Account.find_by_remember_token(cookies[:remember_token])
	end

end
