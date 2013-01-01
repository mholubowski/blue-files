class Document < ActiveRecord::Base
  attr_accessible :category, :sub_category, :sub_sub_category,
  				  :type_of_document, :number_of_pages, :title,
  				  :document_file, :hidden

  belongs_to  :account
  
  after_initialize :init

  validates :account_id, 	     presence: true
  validates :category,		     presence: true
  validates :sub_category,     presence: true
  validates :sub_sub_category, presence: true 
  validates :title,            presence: true #, 
                               # uniqueness: { scope: #TODO improve this
                               # [:category, :sub_sub_category, :sub_category] 
                               #             }


  # validates :document_file,    presence: false,
  #              format: %r{\.(pdf|jpg|jpeg)$}i, #TODO format and error messages
  #              uniqueness: { scope: :title }

  validates :number_of_pages,  numericality: { only_integer: true }

  # file upload                  #uploader class
  mount_uploader :document_file, DocumentUploader

  def init
    self.confirmed = false if self.confirmed.nil?
  end

end
