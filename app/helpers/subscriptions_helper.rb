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

	

end
