class AddTypeOfDocumentToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :type_of_document, :string
  end
end
