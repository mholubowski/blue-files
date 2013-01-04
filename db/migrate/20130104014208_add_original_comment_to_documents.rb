class AddOriginalCommentToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :original_comment, :string
  end
end
