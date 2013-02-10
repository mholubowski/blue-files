class AddTrialExpirationDateToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :trial_expiration_date, :datetime
  end
end
