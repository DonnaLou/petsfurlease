class ProfileController < ApplicationController
  def index
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def create
    @profile = Profile.new(profile_params)
    
    if @profile.save!
      redirect_to @profile
    else
      render :new
    end
  end

  def new
    @profile = Profile.new
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
 
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render 'edit'
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:firstName, :lastName, :description, :city, :state, :zip)
    end
end
