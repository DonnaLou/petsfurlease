class SearchesController < ApplicationController
  def index
    @pets = Pet.page(1)
    @profiles = Profile.page(1)

    render 'index'
  end

  def user
	 	@profiles = Profile.where(zip:params[:zip]).page(1)
    @pets = Pet.page(1)

    render 'index'
	end

	def pet
    @profiles = Profile.page(1)
		@pets = Pet.search(zip: params[:petZip], species: params[:petSpecies]).page(1)
    render 'index'
	end

end
