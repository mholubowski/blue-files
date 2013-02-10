module SubscriptionsHelper

	def max_files(account)
		case account.subscription.plan
		when 1
			250
		when 2
			250
		when 3
			1000
		end
	end

	def min_files(account)
		case account.subscription.plan
		when 1
			250
		when 2
			250
		when 3
			1000
		end
	end

	def price(account)
		case account.subscription.plan	
		when 1
			"Free for 30 Days"
		when 2
			"$19.95 / month"
		when 3
			"$39.95 / month"
		end
	end

	def plan_to_words(id)
		case id
			when 1
				"Free Trial"
			when 2 
				"Pro - 250 files"
			when 3
				"Extra - 1000 files"
		end
	end

	def trial_days_remaining(account)
		distance_of_time_in_words(Time.now, (account.subscription.trial_expiration_date)).to_i
	end

	def change_plan_to(plan_id)
		unless plan_id == current_account.subscription.plan
			# Handles stripe
			token    = current_account.subscription.stripe_customer_token
			customer = Stripe::Customer.retrieve(token)
			customer.update_subscription(plan: plan_id, prorate: true)
			# Handles DB
			current_account.subscription.update_attribute(:plan, plan_id)
			flash[:notice] = "Account subscriptions level has been changed"
		end
	end

	def check_plan_status
		if current_account.documents.count <= Subscription::FILE_LIMITS[:trial]
			unless current_account.in_trial?
				change_plan_to(2) 
			end
		else
			unless current_account.in_trial?
				change_plan_to(3) 
			end
		end
	end

end
