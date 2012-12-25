namespace :db do
	desc "Fill database with sample account and documents data"
	task populate: :environment do

		(1..5).each do |n|
			username  = "testaccount#{n}"
			password  = "123123"
			category  = "Department"
			sub_category = "Course"
			sub_sub_category = "Professor"
			Account.create!(username: username,
							category: category,
							sub_category: sub_category,
						    sub_sub_category: sub_sub_category,
						    password: password,
						    password_confirmation: password,
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
				account.documents.create!(category: category, 
										  sub_category: sub_category,
										  sub_sub_category: sub_sub_category,
										  number_of_pages:  number_of_pages,
										  title: title)
			end
		end

	end
end