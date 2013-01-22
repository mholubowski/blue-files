class Account < ActiveRecord::Base
 attr_accessible :username, :password, :password_confirmation, 
 :accept_terms_and_conditions, :category, 
 :sub_category, :sub_sub_category, :account_admin_password,
 :schedule_type, :admin_name, :admin_email, :admin_phone
 has_secure_password
 before_save :strip_phone
 before_save :create_remember_token
 before_save { |account| account.username = account.username.downcase }
   after_initialize :init

   has_many :documents, dependent: :destroy
   has_many :requests,  dependent: :destroy
   has_many :subscriptions, dependent: :destroy
   
   validates :username, 
   presence:   true,
   uniqueness: true,
   length:  { in: 4..25 },
   format:  {
      with: /^[A-Za-z\d_]+$/,
      message: "can only be alphanumeric with no spaces"}


   validates :password,
   presence: true,
   length: { in: 6..20 }

   validates :password_confirmation,
   presence: true,
   length: { in: 6..20 }

   validates :accept_terms_and_conditions,
   presence: true,
   inclusion: { in: [1], message: "Must accept terms and conditions" }

   validates :schedule_type, presence: true,
   inclusion: { in: ['Quarter', 'Semester']}

   validates :admin_name,
   presence: true,
   length: { maximum: 25},
   format: {
    with: /^[\sA-Za-z]+$/,
    message: "Please use only letters" }

    validates :account_admin_password,
    presence: true,
    length: { in: 4..20 }

    validates :admin_phone,
    presence: true,
    length: { minimum: 10 },
    format: {
      with: /^[\.\s0-9()-]+$/,
      message: "Please enter a valid Phone" }

    validates :admin_email, format: {
      with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,
      message: "Please enter a valid Email" }

    # validates :accept_terms_and_conditions, :acceptance => {:accept => true}           
    # validates_acceptance_of :accept_terms_and_conditions, on: :create, 
    #                  allow_nil: false, message: "hey"

    private
    def strip_phone
      self.admin_phone = admin_phone.to_s.tr('^0-9', '')
    end
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

    def init
      self.category         = "Department" if self.category.nil?
      self.sub_category     = "Course"     if self.sub_category.nil?
      self.sub_sub_category = "Professor"  if self.sub_sub_category.nil?
    end
  end
