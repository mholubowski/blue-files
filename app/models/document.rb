class Document < ActiveRecord::Base
  attr_accessible :category, :sub_category, :sub_sub_category,
  				  :type_of_document, :number_of_pages, :title,
  				  :document_file

  belongs_to  :account


  validates :account_id, 	   presence: true
  validates :category,		   presence: true
  validates :sub_category,     presence: true
  validates :sub_sub_category, presence: true

  validates :number_of_pages,  numericality: { only_integer: true }

  # file upload                  #uploader class
  mount_uploader :document_file, DocumentUploader
end
