class Document < ActiveRecord::Base
  attr_accessible :category, :sub_category, :sub_sub_category,
  				  :type, :number_of_pages

  belongs_to  :account
  before_save :create_remember_token

  validates :account_id, 	   presence: true
  validates :category,		   presence: true
  validates :sub_category,     presence: true
  validates :sub_sub_category, presence: true

  validates :number_of_pages,  numericality: { only_integer: true }

  private
  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
 	end
end
