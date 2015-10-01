class ProfileController < ApplicationController
	before_action :authenticate_user!

  def index
  end

  def pets
    @pets = current_user.pets
  end

  def show
    @profile = current_user.profile
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    
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
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
 
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render 'edit'
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:user_id, :firstName, :lastName, :description, :city, :state, :zip)
    end
end
