class Subscription < ActiveRecord::Base
  attr_accessible :account_id, :stripe_card_token, :plan
  belongs_to :account

end
