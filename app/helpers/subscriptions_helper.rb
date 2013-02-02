module SubscriptionsHelper

	def max_files(account)
		case account.subscription.plan
		when 0
			50
		when 1
			250
		when 2
			1000
		end
	end

	def price(account)
		case account.subscription.plan	
		when 0
			"Free for 30 Days"
		when 1
			"19.95 / month"
		when 2
			"39.95 / month"
		end
	end

end
