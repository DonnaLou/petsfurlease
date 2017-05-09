class SearchesController < ApplicationController

  def index
    @pets = Pet.page(page_param)
    @profiles = Profile.page(page_param)

    render 'index'
  end

  def user
    if(params[:zip].nil?)
      @profiles = Profile.page(page_param)
    else
      @profiles = Profile.where(zip:params[:zip]).page(page_param)
    end
    @pets = Pet.page(page_param)

    render 'index'
	end

	def pet
    species_param = params[:petSpecies].blank? ? "" : params[:petSpecies]
    zip_param = params[:petZip].blank? ? "" : params[:petZip]
    @profiles = Profile.page(page_param)
    @pets = Pet.search(zip: zip_param, species: species_param).page(page_param)
    render 'index'
	end

  private

  def page_param
    return params[:page] if !params[:page].blank?
    return 1
  end

end
