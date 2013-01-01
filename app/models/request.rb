class Request < ActiveRecord::Base
  attr_accessible :content
  belongs_to	  :account

  validates :content,    presence: true, length: { maximum: 60 }
  validates :account_id, presence: true

  default_scope order: 'requests.created_at DESC'

  
end
