class AddCommentCountToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :comment_count, :integer
  end
end
