
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
    a = self.account
    f = a.documents.count
    if f > max_files(a)
      change_plan_to(a.subscription.plan + 1) unless a.subscription.plan == 2 #TODO logic for MAXMAX files
      flash.now[:notice] = "Account file limit has been successfully upgraded"
    elsif f <= min_files(a) #TODO shouldn't downgrade past free trial period
      change_plan_to(a.subscription.plan - 1) unless a.subscription.plan == 0 #TODO logic for MAXMAX files
      flash.now[:notice] = "Account file limit has been successfully downgraded"  
    else 
      puts "!!!!! All good #{f} < #{max_files(a)}"
    end

  end