class AddThreeCategoriesToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :category, :string
    add_column :accounts, :sub_category, :string
    add_column :accounts, :sub_sub_category, :string
  end
end
