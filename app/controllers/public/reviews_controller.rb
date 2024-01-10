class Public::ReviewsController < ApplicationController

  before_action :authenticate_user!

  def new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to review_path(@review.id)
  end


  def show
    @regions = RegionGenre.all
    @review = Review.find(params[:id])
    @same_rates = Review.where(rate: @review.rate).where(shop_id: @review.shop_id).where.not(user_id: current_user.id)
    @comment = Comment.new
  end

  private

  def review_params
    params.require(:review).permit(:review, :rate, :shop_id)
  end

end
