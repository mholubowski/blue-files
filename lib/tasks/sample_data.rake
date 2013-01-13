namespace :db do
	# require 'bcrypt'
	desc "Fill database with sample account and documents data"
	task populate: :environment do

		(1..2).each do |n|
			username   = "testaccount#{n}"
			password   = "123123"
			admin_pass = "123456" #BCrypt::Password.create
			category   = "Department"
			sub_category = "Course"
			sub_sub_category = "Professor"
			schedule_type = ["Quarter", "Semester"]
			Account.create!(username: 		  username,
							category:         category,
							sub_category:     sub_category,
						    sub_sub_category: sub_sub_category,
						    schedule_type:    schedule_type[n-1],
						    password:         password,
						    password_confirmation:  password,
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
				quarter          = ['Fall 2012', 'Fall 2011', 'Fall 2010','Winter 2012', 'Winter 2011',
									'Winter 2010','Spring 2012', 'Spring 2011', 'Spring 2010' ].sample
				number_of_pages  = (1..13).to_a.sample
				type_of_document = ['Test', 'Essay', 'Homework'].sample
				original_comment = "Some clever and helpful notes about this here document, good luck!"
				account.documents.create!(category: category, 
										  sub_category: sub_category,
										  sub_sub_category: sub_sub_category,
										  number_of_pages:  number_of_pages,
										  type_of_document: type_of_document,
										  original_comment: original_comment,
										  title: title,
										  quarter: quarter,
										  views: (1..200).to_a.sample)
			end
		end

		25.times do 
			accounts.each do |account|
				account.requests.create!(content:["Essay for military science",
												  "Econ 10a finals!",
												  "MCSB 111 Homeworks",
												  "Chemistry labs",
												  "AsAm 127 Midterm Outline", 
												  "Psych 1 Notes",
												  "CS 45A project notes"].sample)
			end
		end

		documents = Document.all
		documents.each do |doc|
			n = 0
		rand(20).times do
				doc.document_comments.create!(content: ["Sample comment for the comments section, this files is great",
														"Careful! problems number 3 and 4 on the last page are wrong",
														"This class was just aweful, don't take it nubs"].sample)
				n += 1
			end
		end

	end
end