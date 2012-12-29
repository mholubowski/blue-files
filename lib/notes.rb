					~~~~BLUE documentS~~~~

=========================================================
=========================TO DO===========================

#TODO error messages on forms
#TODO redirect to url.request before siggin?
#TODO AUTHENTICATION
#      \everywhere
#TODO _header nav make dynamic
#TODO style forms
#TODO style _form_error_messages

#TODO full Account model (no has_one)
#TODO Signup wizard

#TODO Dynamic provide: titles

#TODO Better way of setting account_id for file upload

#TODO Automate number_of_pages or remove alltogether
		# \note: num_of_pages used for pricing
General ==============================================
======================================================

- Account
	- House has one username
	- Contact person(s)
		-email
		-name
		-phone number
		-address 
		-credit card info
	- Account info 
		-amount of documents
		-payment plan
		-day since member
		-



- Signin
	*account* is an entire house
	- Username
	- Password
	- pin 
		-4 digits
		-changes automatically
		-email notifications


=========================================================
===================Database Models=======================

Super_admin
	############# MIKE ############
end


Account   
	:username
	:password_digest
	:pin

	:usage_level   ( levels A,B,C ? - # of documents? )

	:credit_card ? or payment info ?

	:total_number_of_pages

	:accepted_terms
	
	has_one  :main_contact
	has_one  :secondary_contact
	has_one  :account_admin
	
	has_many :emails_for_pin  # not needed	
	has_many :documents

	has_one  :account_preference # plural ?
end


Main_contact
	belongs_to :account

	:first_name
	:last_name
	:email  #use for authentication
	:phone

	:home_address # ?

	:security_question #use for authentication
	:security_answer   #use for authentication
end



Secondary_contact
	belongs_to :account

	:first_name
	:last_name
	:email  #use for authentication
	:phone

	:home_address #?

	:security_question #use for authentication
	:security_answer   #use for authentication
end



Email_for_pin
	belongs_to :account

	:email
	:first_name #?
	:last_name  #?
	# limit number of these?
end



Document
	belongs_to :account

	:category 		   #department
	:sub_category 	   #professor
	:sub_sub_category  #class

	:number_of_pages
	:type 	# Test / Essay / Homework 
end



Account_preference
	belongs_to :account

	:category
	:sub_category
	:sub_sub_category

end

=========================================================
========================Pages============================

home page  ->  signup! + all info about blue documents

signin -> username / email / pin creates session
  \
  	documents index to show all documents (where account_id = current)
  	|  \
  	|  	document show (individual documents)	
  	|  	
  	account_admin in nav bar
  		\
  		 admin signin
  		  \
  		   account show   	





