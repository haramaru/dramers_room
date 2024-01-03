class Public::ReviewsController < ApplicationController

  def new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to review_path(@review.id)
  end


  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  private

  def review_params
    params.require(:review).permit(:review, :rate, :shop_id)
  end

end
