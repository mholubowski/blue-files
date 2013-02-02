class AddTotalViewsToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :total_views, :integer
  end
end
