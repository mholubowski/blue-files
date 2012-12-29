class AddHiddenToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :hidden, :string
  end
end
