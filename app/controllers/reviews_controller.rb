class ReviewsController < ApplicationController

  def new
    @review = @caffein_dealer.new_review
  end

  def create
    @review = @caffein_dealer.new_review(params[:review])
    if @review.publish
      redirect_to root_path, notice: "Thanks for adding a review"
    else
      render :new
    end
  end
end

