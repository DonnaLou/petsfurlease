class ProfileController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :update, :edit, :delete]

  def index
  end

  def pets
    @pets = current_user.profile.pets
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    if current_user.profile
      @profile = current_user.profile
      render 'edit'
    end

    @profile = Profile.new
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

  def edit
    @profile = current_user.profile
  
  end

  def update
    @profile = current_user.profile

    if params[:image].nil?
      @profile.image = nil
      @profile.save!
    end 

    if @profile.update(profile_params)
      redirect_to @profile
    else
      render 'edit'
    end
  end

  def search
    @profiles = Profile.where(zip:params[:zip])
    render partial: "profileSearchList"
  end

  private
    def profile_params
      params.require(:profile).permit(:user_id, :firstName, :lastName, 
        :description, :city, :state, :zip, :is_volunteer, :image)
    end
end
