class Subscription < ActiveRecord::Base
  attr_accessible :account_id, :stripe_card_token, :plan, :email, :description, :trial_expiration_date
  belongs_to :account
  before_create :set_trial_expiration

  # validates :account_id, presence: true

  FILE_LIMITS = {
    trial: 250
  }


def save_with_payment
  if valid?
    customer = Stripe::Customer.create(description: description,
    plan: plan, email: email, card: stripe_card_token)
    self.stripe_customer_token = customer.id
    save!
  end
end

def set_trial_expiration
  self.trial_expiration_date = 30.days.from_now
end

end
