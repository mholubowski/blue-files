
def change_plan_to(plan_id)
                  # Handles stripe
                  c  = self.account.subscription.stripe_customer_token
                  cu = Stripe::Customer.retrieve(c)
                  cu.update_subscription(plan: plan_id, prorate: true)
                  # Handles DB
                  self.account.subscription.update_attribute(:plan, plan_id)
                end

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
                def min_files(account)
                  case account.subscription.plan
                  when 0
                    0
                  when 1
                    50
                  when 2
                    250
                  end
                end
                
def check_plan_status
    a = current_account 
    f = a.documents.count
    c_plan = a.subscription.plan
    expired? = c_plan.trial_expiration_date < Time.now
    if f <= 250
      unless c_plan == 1 || !expired?
        change_plan_to(1) 
        flash[:notice] = "Account file limit has been successfully upgraded"
      end
    elsif f > 250 
      unless c_plan == 2 || !expired?
        change_plan_to(2) 
        flash[:notice] "Account file limit has been successfully downgraded"  
      end
    else 
    end
  end



  #####







