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

	def change_plan_to(plan_id)
		unless plan_id == current_account.subscription.plan
			# Handles stripe
			c  = current_account.subscription.stripe_customer_token
			cu = Stripe::Customer.retrieve(c)
			cu.update_subscription(plan: plan_id, prorate: true)
			# Handles DB
			current_account.update_subscription(plan:plan_id)
			flash.now[:success] = "Successfully changed Subscription!"
		else
			flash.now[:notice] = "You have chosen to change your plan to your current plan"
		end

	end

end
