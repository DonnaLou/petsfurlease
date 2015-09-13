class PetsController < ApplicationController

	def new
	end

	def show
		@pet = Pet.new
		@pet.name = "Penny"
		@pet.details = "Test description"
		@pet.breed = "Pit bull mix"
		@pet.age = 3
	end
end
