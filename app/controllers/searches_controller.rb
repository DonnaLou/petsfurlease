class SearchesController < ApplicationController

  def index
    @pets = Pet.all
    @profiles = Profile.all

    render 'index'
  end

  def user
	 	@profiles = Profile.where(zip:params[:zip])
    @pets = Pet.all

    render 'index'
	end

	def pet
    @profiles = Profile.all
		@pets = Pet.search(zip: params[:zip], species: params[:species])
    render 'index'
	end

end
