class ReviewController < ApplicationController

  def create
    @pets = Pet.all
    @profiles = Profile.all

    render 'index'
  end
end
