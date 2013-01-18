class DocumentComment < ActiveRecord::Base
  attr_accessible :content, :document_id
  belongs_to :document
  before_save :count_view
  validates :content, presence: true, length: { maximum: 160 }
  validates :document_id, presence: true

  # default_scope order: 'document_comments.created_at DESC'
  private
  	def count_view
  		id = self.document_id
  		num = Document.find(id).comment_count + 1
  		Document.find(id).update_attributes(comment_count: num)
  	end

end
