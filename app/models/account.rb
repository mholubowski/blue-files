class Account < ActiveRecord::Base
   attr_accessible :username, :password, :password_confirmation
   has_secure_password

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
end
