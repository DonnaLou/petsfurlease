class HomeController < ApplicationController
  def index
  end

  def coming_soon
  	render 'coming_soon'
  end

  def sitter
  	render 'sitter'
  end

  def about_us
  	render 'about_us'
  end
end
