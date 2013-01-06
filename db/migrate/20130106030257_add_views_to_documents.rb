 class AddViewsToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :views, :integer
  end
end
