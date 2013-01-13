class AddScheduleTypeToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :schedule_type, :string
  end
end
