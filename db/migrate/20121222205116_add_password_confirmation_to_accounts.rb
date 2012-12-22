class AddPasswordConfirmationToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :password_confirmation, :string
  end
end
