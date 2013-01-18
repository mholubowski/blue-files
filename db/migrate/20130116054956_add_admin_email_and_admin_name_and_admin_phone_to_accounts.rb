class AddAdminEmailAndAdminNameAndAdminPhoneToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :admin_email, :string
    add_column :accounts, :admin_phone, :string
    add_column :accounts, :admin_name, :string
  end
end
