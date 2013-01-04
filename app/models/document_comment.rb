class DocumentComment < ActiveRecord::Base
  attr_accessible :content, :document_id
  belongs_to :document

  validates :content, presence: true, length: { maximum: 160 }
  validates :document_id, presence: true

  default_scope order: 'document_comments.created_at DESC'
end
