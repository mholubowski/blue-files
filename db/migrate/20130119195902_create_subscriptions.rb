class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :account_id
      t.string :stripe_card_token

      t.timestamps
    end
  end
end
