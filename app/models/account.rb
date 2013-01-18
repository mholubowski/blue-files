class Account < ActiveRecord::Base
   attr_accessible :username, :password, :password_confirmation, 
                   :accept_terms_and_conditions, :category, 
                   :sub_category, :sub_sub_category, :account_admin_password,
                   :schedule_type, :admin_name, :admin_email, :admin_phone
   has_secure_password
   before_save :create_remember_token
   after_initialize :init

   has_many :documents, dependent: :destroy
   has_many :requests,  dependent: :destroy
   
    validates :username, 
   			  presence:   true,
   			  uniqueness: true,
   			  length:  { maximum:25 }


  	validates :password,
   			  presence: true,
   			  length: { in: 6..20 }

    validates :password_confirmation,
   		    presence: true,
   		 	  length: { in: 6..20 }

    validates :accept_terms_and_conditions,
          presence: true,
          inclusion: { in: [1],message: "Must accept terms and conditions" }
             

 private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

    def init
      self.category         = "Department" if self.category.nil?
      self.sub_category     = "Course"     if self.sub_category.nil?
      self.sub_sub_category = "Professor"  if self.sub_sub_category.nil?
    end
end
