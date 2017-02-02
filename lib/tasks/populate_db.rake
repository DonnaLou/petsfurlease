namespace :populate_db do
  desc "Add Profiles and Pets to database"
  task profile: :environment do
  	(1..10).each do |i|
  		profile = FactoryGirl.create(:profile)
  		(1..5).each do |x|
  			pet = FactoryGirl.build(:pet)
  			pet.profile = profile
  			pet.save!
  		end
  	end
  end

end
