module SessionsHelper

	def sign_in(account)
		cookies[:remember_token] = { value: account.remember_token,
									 expires: 2.weeks.from_now }
									 #TODO notify users of time-outs
	end

	def sign_in_admin(account)
		cookies[:remember_token_admin] = { value: account.remember_token,
									 	   expires: 2.weeks.from_now }
									 	   #TODO notify users of time-out
	end

	def admin?
		cookies[:remember_token_admin] == current_account.remember_token if signed_in?
	end

	def admin_user
	  unless cookies[:remember_token_admin] == current_account.remember_token 
     	 flash[:error] = "You must be an admin"
     	 redirect_to root_path
     	end
    end

	def signed_in?
		!current_account.nil?
	end

	def signed_in_user
		unless signed_in?
			store_location
			redirect_to signin_path, notice: "Please sign in to continue"
		end
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	def store_location
		session[:return_to] = request.url
	end

	def sign_out
		self.current_account = nil
		cookies.delete(:remember_token)
		cookies.delete(:remember_token_admin)
		cookies.delete(:recently_viewed)
	end

	def current_account
		@current_account ||= Account.find_by_remember_token(cookies[:remember_token])
	end

	def current_account=(account)
		@current_account = account
	end

	def recently_viewed(id)
	    if cookies[:recently_viewed].nil?
			cookies[:recently_viewed] = id
		else
			a = cookies[:recently_viewed].split("%")
			cookies[:recently_viewed] = cookies[:recently_viewed] << "%#{id}" unless a.last == id
		end

	end

end
