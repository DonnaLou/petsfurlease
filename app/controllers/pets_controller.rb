class PetsController < ApplicationController
	def show
		@pet = Pet.find(params[:id])
	end

	def new
		@pet = Pet.new
	end

	def create
		begin
			ActiveRecord::Base.transaction do
				@pet = Pet.new(pet_params)
				@pet.profile_id = current_user.profile.id
				if @pet.valid?		
					if @pet.save!
						redirect_to @pet
					end
				else
					render :new
				end
			end
		rescue Exception => e
			Rails.logger.error "Exception: #{e.to_s}, Backtrace: #{e.backtrace.to_s}"
			render :new
		end
	end

	def edit
		@pet = Pet.find(params[:id])
	end
	
	def update
	  @pet = Pet.find(params[:id])

	  if @pet.image? && params[:petDeleteImage].present? && params[:petDeleteImage] == "1"
	  	@pet.image = nil
	  	@pet.save!
	  end

	  if @pet.update(pet_params)
	    redirect_to @pet
	  else
	    render 'edit'
	  end
	end

	def destroy
		@pet = current_user.profile.pets.find(params[:id])
		@pet.destroy

		redirect_to :back
	end

	private
	
	def pet_params
		params.require(:pet).permit(:id, :name, :species, :breed, :age, :details, 
			:weight, :gender, :profile_id, :helpWanted, :helpStartDate, :helpEndDate, :image)
	end

end
