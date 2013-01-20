class AddEmailAndDescriptionToSubscriptions < ActiveRecord::Migration
  def change
  	    add_column :subscriptions, :email, :string
  	    add_column :subscriptions, :description, :string
  end
end
