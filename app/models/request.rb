class Request < ActiveRecord::Base
  attr_accessible :content
  belongs_to	  :account
end
