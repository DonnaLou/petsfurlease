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
	end

	def edit
	end
	
	def update
	end

	def delete
		@pet.destroy
	end

	private
		def pet_params
			params.require(:person).permit(:id)
		end

end
