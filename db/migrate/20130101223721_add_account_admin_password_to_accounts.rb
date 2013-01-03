class AddAccountAdminPasswordToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :account_admin_password, :string
  end
end
