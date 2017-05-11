class SearchesController < ApplicationController

  def index
    redirect_to action: "pet"
  end

  def user
    if zip_param.blank?
      @profiles = Profile.page(page_param)
    else
      @profiles = Profile.where(zip:params[:zip]).page(page_param)
    end

    @pets = Pet.page(1)
    @user_zip = zip_param
    render 'index'
	end

	def pet
    @pet_zip_param = pet_zip_param
    @pet_species_param = species_param
    @profiles = Profile.page(1)
    @pets = Pet.search(zip: pet_zip_param, species: species_param).page(page_param)
    render 'index'
	end

  private

  def page_param
    return params[:page].blank? ? 1 : params[:page]
  end

  def species_param 
    return params[:petSpecies].blank? ? "" : params[:petSpecies]
  end

  def pet_zip_param
    return params[:petZip].blank? ? "" : params[:petZip]
  end

  def zip_param
    return params[:zip].blank? ? "" : params[:zip]
  end

end
