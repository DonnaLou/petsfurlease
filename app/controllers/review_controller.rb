class ReviewController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def create
    review = Review.new
    review.rating = params[:rating]
    review.details = params[:comments]

    if params[:review_subject_type].present?
      review.review_subject = (params[:review_subject_type].constantize).find(params[:review_subject_id])
    end

    review.user = current_user

    if review.valid?
      review.save!
      render status: 200, json:{status: true}
    else
      render status: 500, json: review.errors.full_messages
    end

  end
end
