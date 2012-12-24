class Account < ActiveRecord::Base
   attr_accessible :username, :password, :password_confirmation, 
                   :accept_terms_and_conditions
   has_secure_password
   before_save :create_remember_token


   has_many :documents

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

end
