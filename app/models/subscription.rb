class Subscription < ActiveRecord::Base
  attr_accessible :account_id, :stripe_card_token, :plan, :email, :description
  belongs_to :account

  # validates :account_id, presence: true


  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(description: description,
      plan: plan, email: email, card: stripe_card_token)

      self.stripe_customer_token = customer.id
      save!
    end
  end

end
