class Document < ActiveRecord::Base
  attr_accessible :category, :sub_category, :sub_sub_category,
  				  :type_of_document, :number_of_pages, :title,
  				  :document_file, :hidden, :original_comment, :views,
            :comment_count, :quarter

  belongs_to  :account
  has_many    :document_comments, dependent: :destroy
  
  after_initialize :init

  validates :account_id, 	     presence: true
  validates :title,            presence: {message: "Please provide a title"}
  validates :category,         presence: {message: "Please choose a Department / Major"}
  validates :sub_category,     presence: {message: "Please provide a course number"}
  validates :sub_sub_category, presence: {message: "Please include a name"} 
  #, 
                               # uniqueness: { scope: #TODO improve this
                               # [:category, :sub_sub_category, :sub_category] 
                               #             }


  validates :document_file, presence: {message: "Please attatch a PDF"}
  validates :document_file,
               format:{
                 with: %r{\.(pdf|pdf)$}i, message: "Please convert the file to PDF"
                }
                #TODO format and error messages


  #              uniqueness: { scope: :title }

  # validates :number_of_pages,  numericality: { only_integer: true }

  # file upload                  #uploader class
  mount_uploader :document_file, DocumentUploader

  def init
    self.confirmed = false if self.confirmed.nil?
    self.views     = 0     if self.views.nil?
    self.comment_count = 0     if self.comment_count.nil?
  end
end
