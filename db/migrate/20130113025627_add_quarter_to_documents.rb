class AddQuarterToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :quarter, :string
  end
end
