class ProfileController < ApplicationController
  def index
  end

  def show
    @profile = Profile.new
    @profile.firstName = "Kevin"
    @profile.lastName = "Duensing"
    @profile.description = "description"
    @profile.city = "testCity"
    @profile.state = "testState"
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
  end

  private
    def profile_params
      params.require(:profile).permit(:firstName, :lastName, :description, :city, :state)
    end
end
