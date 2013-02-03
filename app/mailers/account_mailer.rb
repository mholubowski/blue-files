class AccountMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.account_mailer.signup_confirmation.subject
  #
  def signup_confirmation(subscription)
    @account  = subscription.account
    @last4 = Stripe::Customer.retrieve(subscription.stripe_customer_token).active_card.last4
    mail to: @account.admin_email, subject: "Sign Up Confirmation"
  end

  def password_reset(account)
    @account = account
    mail to: account.admin_email, :subject => "Password Reset"
  end

end
