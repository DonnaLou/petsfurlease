class PetsController < ApplicationController

	def index
		@pets = Pet.all
	end

	def show
		@pet = Pet.find(params[:id])
	end

	def new
		@pet = Pet.new
	end

	def create
		@pet = Pet.new(pet_params)
		
		if @pet.save!
			redirect_to @pet
		else
			render :new
		end
	end

	def edit
	end
	
	def update
	end

	def destroy
		@pet = Pet.find(params[:id])
		@pet.destroy

		render :index
	end

	private
		def pet_params
			params.require(:pet).permit(:id, :name, :species, :breed, :age, :details)
		end

end
