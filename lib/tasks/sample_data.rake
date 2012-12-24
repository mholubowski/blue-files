namespace :db do
	desc "Fill database with sample account and documents data"
	task populate: :environment do

		(1..5).each do |n|
			username  = "testaccount#{n}"
			password  = "123123"
			Account.create!(username: username,
						    password: password,
						    password_confirmation: password,
						    accept_terms_and_conditions: 1)
		end 

		accounts = Account.all
		50.times do 
			accounts.each do |account| 
				category =     ['Economics', 'Math', 'MCDB', 'Philosophy', 'Global Studies'].sample
				sub_category = ['100A', '1', '37B', '140C', '4A', '137BA', '222A', '101'   ].sample
				sub_sub_category = ['Babcock', 'Burns', 'Ernest', 'L.S. Kim', 'Sonstellie' ].sample
				number_of_pages  =  (1..13).to_a.sample
				account.documents.create!(category: category, 
										  sub_category: sub_category,
										  sub_sub_category: sub_sub_category,
										  number_of_pages:  number_of_pages)
			end
		end

	end
end