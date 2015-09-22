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

  end

  def new
  end

  def edit
  end
end
