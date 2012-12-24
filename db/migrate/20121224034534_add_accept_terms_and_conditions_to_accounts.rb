class AddAcceptTermsAndConditionsToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :accept_terms_and_conditions, :integer
  end
end
