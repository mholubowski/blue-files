namespace :db do
	
	desc "Add Files"
	task add_files: :environment do
		files = 50
		account = 1

		files.times do 
			category     = ['Economics', 'Math', 'MCDB', 'Philosophy', 'Global Studies' ].sample
				sub_category = ['100A', '1', '37B', '140C', '4A', '137BA', '222A', '101'    ].sample
				sub_sub_category = ['Babcock', 'Burns', 'Ernest', 'L.S. Kim', 'Sonstellie'  ].sample
				title            = ['Midterm Essay', 'Spring 2010 Final', 'Final B', 'Quiz 2'].sample
				quarter          = ['Fall 2012', 'Fall 2011', 'Fall 2010','Winter 2012', 'Winter 2011',
									'Winter 2010','Spring 2012', 'Spring 2011', 'Spring 2010' ].sample
				number_of_pages  = (1..13).to_a.sample
				type_of_document = ['Test', 'Essay', 'Homework'].sample
				original_comment = "Some clever and helpful notes about this here document, good luck!"
				Account.find(account).documents.create!(category: category, 
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
end