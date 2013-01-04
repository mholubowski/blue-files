class CreateDocumentComments < ActiveRecord::Migration
  def change
    create_table :document_comments do |t|
      t.string :content
      t.integer :document_id

      t.timestamps
    end
  end
end
