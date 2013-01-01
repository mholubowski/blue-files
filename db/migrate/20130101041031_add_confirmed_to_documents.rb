class AddConfirmedToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :confirmed, :boolean
  end
end
