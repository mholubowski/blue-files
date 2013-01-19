class AddPlanToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :plan, :integer
  end
end
