namespace :db do
	# require 'bcrypt'
	desc "Fill database with sample account and documents data"
	task populate: :environment do

		(1..5).each do |n|
			username   = "testaccount#{n}"
			password   = "123123"
			admin_pass = "123456" #BCrypt::Password.create
			category   = "Department"
			sub_category = "Course"
			sub_sub_category = "Professor"
			Account.create!(username: username,
							category: category,
							sub_category: sub_category,
						    sub_sub_category: sub_sub_category,
						    password: password,
						    password_confirmation: password,
						    account_admin_password: admin_pass,
						    accept_terms_and_conditions: 1)
		end 

		accounts = Account.all
		200.times do 
			accounts.each do |account| 
				category     = ['Economics', 'Math', 'MCDB', 'Philosophy', 'Global Studies' ].sample
				sub_category = ['100A', '1', '37B', '140C', '4A', '137BA', '222A', '101'    ].sample
				sub_sub_category = ['Babcock', 'Burns', 'Ernest', 'L.S. Kim', 'Sonstellie'  ].sample
				title            = ['Midterm Essay', 'Spring 2010 Final', 'Final B', 'Quiz 2'].sample
				number_of_pages  = (1..13).to_a.sample
				type_of_document = ['Test', 'Essay', 'Homework'].sample
				original_comment = "Some clever and helpful notes about this here document, good luck!"
				account.documents.create!(category: category, 
										  sub_category: sub_category,
										  sub_sub_category: sub_sub_category,
										  number_of_pages:  number_of_pages,
										  title: title,
										  type_of_document: type_of_document,
										  original_comment: original_comment)
			end
		end
		25.times do 
			accounts.each do |account|
				account.requests.create!(content:["Essay for military science","Econ 10a finals!",
												  "MCSB 111 Homeworks","Chemistry labs",
												  "AsAm 127 Midterm Outline", "Psych 1 Notes",
												  "CS 45A project notes"].sample)
			end
		end
	end
end