class ReviewController < ApplicationController
  before_filter :authenticate_user!
  def index
  end

  def create
    review = Review.new
    review.rating = params[:rating]
    review.details = params[:comments]

    if params[:review_subject_type].present?
      review_subject = (params[:review_subject_type].constantize).find(params[:review_subject_id])
      review.review_subject = review_subject
    end

    review.user = current_user

    if review.valid?
      review.save!
      render partial:'shared/reviewDisplay', locals:{:r => review}
    else
      render status: 500, json: review.errors.full_messages
    end

  end
end
