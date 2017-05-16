namespace :populate_db do
  desc "Add Profiles and Pets to database"
  task profile: :environment do
    #create 10 new profiles, 10 pets each profile
  	(1..10).each do |i|
  		profile = FactoryGirl.create(:profile)
  		(1..10).each do |x|
  			pet = FactoryGirl.build(:pet)
  			pet.profile = profile
  			pet.save!
  		end
  	end
    puts "created 10 profiles with 10 pets each"
  end

end
