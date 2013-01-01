class Request < ActiveRecord::Base
  attr_accessible :content
  belongs_to	  :account

  default_scope order: 'requests.created_at DESC'
end
